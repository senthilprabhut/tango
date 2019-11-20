def handler(context, inputs):
    greeting = "nihao, {0}!".format(inputs["target"])
    print(greeting)

    outputs = {
      "greeting": greeting
    }

    return outputs
