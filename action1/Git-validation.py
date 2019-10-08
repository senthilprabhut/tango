import json
import gitlab

def handler(context, inputs):
    outputs = {}
    try:
        gl = gitlab.Gitlab(inputs["baseUrl"], private_token=inputs["token"])
        gl.auth()
        outputs["status"] = "success"
        outputs["result"] = "True"
    except Exception as e:
        print(e)
        print("Exception")
        outputs["status"] = "failure"
        outputs["result"] = "False"

    return outputs
