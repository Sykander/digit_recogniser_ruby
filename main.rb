require_relative './lib/accessor.rb'

@file = Accessor.get_file_reader
@file.get_mnist_training_data
@net = Accessor.get_neural_network( 28**2, [100, 100, 100], 10)
