
class NeuralNetwork

  # Make neural net information easily available
  attr_reader :inputs_count, :outputs_count, :layers_count

  def initialize(inputs, layers, outputs)
    # initialize every neural net with an input, layer, and output count
    @inputs_count = inputs
    @layers_count = layers
    @outputs_count = outputs

    # declare the neural net itself
    @neural_net = Array.new(@layers_count)
    # put an array in each index for each node
    @neural_net.each do |layer|
      layer = Array.new(@inputs_count)
    end
    # add output layer biasses
    @neural_net.push Array.new(@outputs_count)
  end

  def make_prediction inputs
    # Multiply each input by it's weight
    data = []
    i = 0
    while i < inputs.length
      data.push inputs[i]*weights[0][i]
      ++i
    end

  end

  def gen_weights
    # CREATE THE ARRAY
    weights = Array.new(@layers_count)
    # put an array in each index of weights which has length of the inputs squared
    weights.each do |layer|
      layer = Array.new(@inputs_count)
      layer.each do |node|
        node = Array.new(@inputs_count)
      end
    end
    # add one final layer to connect to the output
    weights.push Array.new(@outputs_count*@inputs_count)

    # FILL THE ARRAY
    gen = Random.new
    weights.each do |weight_layer|
      weight_layer.each do |weight_node|
        weight_node.each do |weight|
          weight = gen.rand(0..10)
        end
      end
    end
    @weights = weights
  end

  def gen_biasses
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
