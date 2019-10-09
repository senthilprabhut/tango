def handler(context, inputs):
    greeting = "hello, {0}!".format(inputs["target"])
    print(greeting)

    outputs = {
      "greeting": greeting
    }

    return outputs
