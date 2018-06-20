require_relative './lib/accessor.rb'

@file = Accessor.get_file_reader
@file.get_mnist_training_data
@net = Accessor.get_neural_network( 28**2, [100, 100, 100], 10)
puts @net.gen_weights[1][1][1]
@net.gen_biasses

data = @file.training_data.sample
data_image = @file.format_image (data.first)
data_target = data[1]

puts @net.make_prediction data_image
