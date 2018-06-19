
class NeuralNetwork

  # Make neural net information easily available
  attr_reader :neural_net, :inputs_count

  def initialize(inputs, layers, outputs)
    @inputs_count = inputs
    @outputs_count = outputs
    # Calculate complete array of layers including output
    # Makes a model of how the neural network should be layed out
    neural_net_model = Array.new()

    neural_net_model += layers
    neural_net_model.push outputs
    @neural_net_model = neural_net_model
    # Make the final neural network
    @neural_net = Array.new( neural_net_model.length )
    i = 0;
    while i< neural_net_model.lenth
      @neural_net[i] = Array.new(neural_net_model[i])
    end
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
    # Should return a 3 dimensional array of values
    # The first 2 dimensions should reference a node in the @neural_net array
    # The third dimension should contain an array of values corresponding to
    # each node in the layer below the one being referenced

    weights = @neural_net
    # Make an array for storing weights in
    # declare a counter for layers
    layer = 0
    while layer< weights.length
      node = 0
      while node<weights[layer]
        if layer == 0
          weight[node] = Array.new(inputs)
        else
          weight[node] = Array.new(@neural_net_model layer -1
        end
        # increment the counter
        node += 1
      end
      # increment the counter
      layer += 1
    end

    gen = Random.new
    # Fill the array
    weights.each do |layer|
      layer.each do |node|
        node.each do |weight|
          # put a random number between -10 and 10 into each weight
          weight = gen.rand * 20 - 10
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
