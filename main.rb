require_relative './lib/accessor.rb'

@file = Accessor.get_file_reader
@file.get_mnist_training_data
@net = Accessor.get_neural_network
@new.model_net( 28**2, [100, 100, 100], 10)
@net.gen_biasses
@net.gen_weights

data = @file.training_data.sample
data_image = @file.format_image (data.first)
data_target = data[1]

output = @net.make_prediction data_image

puts 'Difference to target'
diff = []
i = 0
while i < data_target.length
  diff.push data_target[i].abs - output[i].abs

  i += 1
end

puts diff
