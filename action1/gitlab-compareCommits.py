import json
import math
import gitlab

def handler(context, inputs):
    outputs = {}
    try:
        gl = gitlab.Gitlab(inputs["baseUrl"], private_token=inputs["token"])
        project = gl.projects.get(inputs["repositoryName"] + "/" + inputs["projectName"])
        result = project.repository_compare(inputs["fromCommit"], inputs["toCommit"])
        # The value of inputs can not be empty.
        dirPath = inputs["dirPath"] + "/" if "dirPath" in inputs else ""
        print(dirPath)
        getFileAction = lambda diff: "ADDED" if diff["new_file"] else "DELETED" if diff["deleted_file"] else "UPDATED"
        affectedFiles = []
        # 1. Get the list of file paths under dirPath.
        for file_diff in result['diffs']:
            if file_diff["new_path"].startswith(dirPath):
                affectedFiles.append(file_diff["new_path"])
        
        # 2. Sort paths and get the sublist according to page number and size.
        affectedFiles.sort()
        outputs["totalPages"] = math.ceil(len(affectedFiles) / int(inputs["pageSize"]))
        outputs["totalElements"] = len(affectedFiles)
        # page number starts from 0
        filesToReturn = getPagedSlice(int(inputs["page"]), int(inputs["pageSize"]), affectedFiles)
        # 3. Creates a map key is the file path and value is file name, path, and commits affecting the file.
        changedFiles = {}
        for path in filesToReturn:
            content = {}
            # Extract file name from path.
            content["name"] = path if path.find('/') == -1 else path[path.rfind('/') + 1:]
            content["path"] = path
            content["commits"] = []
            changedFiles[path] = content

        # 4. Iterates commits between fromCommit and toCommit.
        for commit in result["commits"]:
            print(commit)
            # commit is dict.
            diffs = project.commits.get(commit["id"]).diff()
            # 4.1 Check whether a file in map is affected in this commit.
            for diff in diffs:
                for path, changedFile in changedFiles.items():
                    if diff["new_path"] == path or diff["old_path"] == path:
                        commitItem = {}
                        file = project.files.get(file_path=path, ref=commit["id"])
                        commitItem["content"] = file.content
                        commitItem["encoding"] = file.encoding
                        commitItem["authorName"] = commit["author_name"]
                        commitItem["committerEmail"] = commit["committer_email"]
                        commitItem["committerName"] = commit["committer_name"]
                        commitItem["committedDate"] = commit["committed_date"]
                        commitItem["comments"] = commit["message"]
                        commitItem["commitId"] = file.commit_id
                        commitItem["fileAction"] = getFileAction(diff)
                        changedFile["commits"].append(commitItem)
        # 5. Save changed files to match format of ScmFile.
        outputs["content"] = [v for k, v in changedFiles.items()]
        
        return outputs
    except Exception as e:
        print(e)
        print("Exception")
        outputs["status"] = "failure"
        outputs["reslut"] = "False"

    return outputs
    
def getPagedSlice(page, pageSize, affectedFiles):
    start = page * pageSize
    end = min(start + pageSize, len(affectedFiles))
    if start >= end:
        return []
    else:
        return affectedFiles[start:end]
    
