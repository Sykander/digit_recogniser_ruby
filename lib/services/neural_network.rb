
class NeuralNetwork

  # Make neural net information easily available
  attr_reader :neural_net, :inputs_count

  def model_net inputs, layers, outputs
    @inputs_count = inputs
    @outputs_count = outputs
    # Calculate complete array of layers including output
    # Makes a model of how the neural network should be layed out
    neural_net_model = layers
    neural_net_model.push outputs
    @neural_net_model = neural_net_model

    # Make the final neural network
    neural_net = Array.new( @neural_net_model.length )
    i = 0;
    while i< @neural_net_model.length
      neural_net[i] = Array.new(@neural_net_model[i])
      i += 1
    end
    @neural_net = neural_net
  end

  def evaluate_prediction inputs, target

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
          @neural_net[layer][node] = sigmoid(input_x_weight - @biasses[layer][node])
        else
          i = 0
          node_x_weight = 0
          while i < @neural_net[layer -1].length
            node_x_weight += @neural_net[layer-1][i] * @weights[layer][node][i]
            i += 1
          end
          @neural_net[layer][node] = sigmoid(node_x_weight - @biasses[layer][node])
        end
        node += 1
      end
      layer += 1
    end
    # compute sigmoid on each of the outputs
    @neural_net.last.each do |output|
      output = sigmoid output
    end
    # return the output layer
    outputs = @neural_net.last
  end

  def gen_weights
    # Should return a 3 dimensional array of values
    # The first 2 dimensions should reference a node in the @neural_net array
    # The third dimension should contain an array of values corresponding to
    # each node in the layer below the one being referenced

    # Make an array for storing weights in
    weights = Array.new( @neural_net_model.length )
    i = 0;
    while i< @neural_net_model.length
      weights[i] = Array.new(@neural_net_model[i])
      i += 1
    end

    # declare a counter for layers
    layer = 0
    while layer < weights.length
      # counter for nodes
      node = 0
      while node < weights[layer].length
        # if its the first layer then the number of weights for each node needs to
        # correspond to the number of inputs
        if layer == 0
          weights[layer][node] = Array.new( @inputs_count )
        # if it's not the first layer then the number of weights for each node needs
        # to correspond to the number of nodes on the previous layer
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
    # Fill the array with random arbitrary values
    i=0
    while i< weights.length
      j=0
      while j< weights[i].length
        k=0
        while k< weights[i][j].length
          weights[i][j][k] = (gen.rand-0.5) * 100
          k += 1
        end
        j += 1
      end
      i += 1
    end
    # set the variable weights to be available everywher and also return the weights
    @weights = weights
  end

  def gen_biasses
    gen = Random.new
    # declare an array to store the biasses in
    biasses = Array.new( @neural_net_model.length )
    i = 0;
    while i< @neural_net_model.length
      biasses[i] = Array.new( @neural_net_model[i])
      i += 1
    end

    # fill the array with random arbitrary values
    i=0
    while i < biasses.length
      j=0
      while j < biasses[i].length
        biasses[i][j] = (gen.rand-0.5) * 20
        j += 1
      end
      i += 1
    end
    # return biasses and also declare @biasses to be available everywhere
    @biasses = biasses
  end

  # The network activation function
  # This network implements the sigmoid function
  # Should return a value between 0 and 1
  def sigmoid input
    Math.exp(input) / (1 + Math.exp(input) )
  end
end
