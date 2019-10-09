def handler(context, inputs):
    greeting = "mabuhay, {0}!".format(inputs["target"])
    print(greeting)

    outputs = {
      "greeting": greeting
    }

    return outputs
