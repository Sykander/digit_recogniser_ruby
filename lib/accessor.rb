require_relative './services/file_reader.rb'
require_relative './services/neural_network.rb'

class Accessor
  def self.get_file_reader
    FileReader.new
  end

  def self.get_neural_network(inputs, layers, outputs)
    NeuralNetwork.new(inputs, layers, outputs)
  end
end
