
class NeuralNetwork

  # Make neural net information easily available
  attr_reader :neural_net, :inputs_count

  def initialize(inputs, layers, outputs)
    @inputs_count = inputs
    @outputs_count = outputs
    # Calculate complete array of layers including output
    # Makes a model of how the neural network should be layed out
    neural_net_model = layers
    neural_net_model.push outputs
    @neural_net_model = neural_net_model

    # Make the final neural network
    @neural_net = Array.new( neural_net_model.length )
    i = 0;
    while i< neural_net_model.length
      @neural_net[i] = Array.new(neural_net_model[i])
      i += 1
    end
  end

  def make_prediction inputs
    layer = 0
    while layer < @neural_net.length
      node = 0
      while node < @neural_net[layer].length
        if layer == 0
          i = 0
          input_x_weight = 0
          while i < inputs.length
            input_x_weight += inputs[i] * @weights[layer][node][i]
            i += 1
          end
          @neural_net[layer][node] = sigmoid(input_x_weight - biasses[layer][node])
        else
          i = 0
          node_x_weight = 0
          while i < @neural_net[layer -1].length
            node_x_weight += @neural_net[layer-1][i] * @weights[layer][node][i]
            i += 1
          end
          @neural_net[layer][node] = sigmoid(node_x_weight - biasses[layer][node])
        end
        node += 1
      end
      layer += 1
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
    while layer < weights.length
      node = 0
      while node < weights[layer]
        if layer == 0
          weights[layer][node] = Array.new(inputs)
        else
          weights[layer][node] = Array.new( @neural_net_model[layer -1] )
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
    gen = Random.new

    biasses = @neural_net
    biasses.each do |layer|
      layer.each do |node|
        node.each do
          node = gen.rand * 20 - 10
        end
      end
    end

    @biasses = biasses
  end

  def sigmoid input
    Math.exp(input) / (1 + Math.exp(input) )
  end
end
