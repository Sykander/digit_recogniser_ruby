require "zlib"
class FileReader

  def initialize
    TRAINING_LABELS_PATH = './resources/train-labels-idx1-ubyte'
    TRAINING_IMAGES_PATH = '.resources/train-images-idx3-ubyte'
  end

  def get_mnist_training_data
    
  end
end

FileReader.new.get_mnist_training_data
