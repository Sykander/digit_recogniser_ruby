
class NeuralNetwork

  def initialize(inputs, layers, outputs)
    @inputs_count = inputs
    @layers_count = layers
    @outputs_count = outputs
  end

  def gen_weights
    # CREATE THE ARRAY
    weights = Array.new(@layers_count)
    # put an array in each index of weights which has length of the inputs squared
    weights.each do |layer|
      layer = Array.new(@inputs_count**2)
    end
    # add one final layer to connect to the output
    weights.push Array.new(@outputs_count*@inputs_count)

    # FILL THE ARRAY
    gen = Random.new
    weights.each do |weight_layer|
      weight_layer.each do |weight|
        weight = gen.rand(0..10)
      end
    end
    @weights = weights
  end

  def get_biasses
    # CREATE THE ARRAY
    biasses = Array.new(@layers_count)
    # put an array in each index of weights which has length of the inputs
    biasses.each do |layer|
      layer = Array.new(@inputs_count)
    end
    # add output layer biasses
    biasses.push Array.new(@outputs_count)

    # FILL THE ARRAY
    gen = Random.new
    biasses.each do |bias_layer|
      bias_layer.each do |bias|
        bias = gen.rand(0..10)
      end
    end
    @biasses = biasses
  end

  def sigmoid input
    Math.exp(input) / (1 + Math.exp(input) )
  end
end
