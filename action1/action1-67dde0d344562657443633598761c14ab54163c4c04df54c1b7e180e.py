def handler(context, inputs):
    greeting = "Vanakkam, {0}!".format(inputs["target"])
    print(greeting)

    outputs = {
      "greeting": greeting
    }

    return outputs
