def handler(context, inputs):
    greeting = "NiHao, {0}!".format(inputs["target"])
    print(greeting)

    outputs = {
      "greeting": greeting
    }

    return outputs
