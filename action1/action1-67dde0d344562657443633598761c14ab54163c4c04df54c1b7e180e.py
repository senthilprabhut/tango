def handler(context, inputs):
    greeting = "Hi, {0}!".format(inputs["target"])
    print(greeting)

    outputs = {
      "greeting": greeting
    }

    return outputs
