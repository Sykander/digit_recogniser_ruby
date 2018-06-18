require "zlib"
class FileReader

  # Paths to the data
  TRAINING_LABELS_PATH = './resources/train-labels-idx1-ubyte.gz'
  TRAINING_IMAGES_PATH = './resources/train-images-idx3-ubyte.gz'

  def initialize

  end

  def get_mnist_training_data
    # declare arrays to store the data in
    images = Array.new
    labels = Array.new
    # Open the labels file
    Zlib::GzipReader.open(TRAINING_LABELS_PATH) do |f|
      # Get the magic and label_count and unpacks
      magic, label_count = f.read(8).unpack('N2')
      # reads that many labels and unpacks
      # puts the labels into the labels array
      labels = f.read(label_count).unpack('C*')
    end
    # Open the images file
    Zlib::GzipReader.open(TRAINING_IMAGES_PATH) do |f|
      # Get the magic and image count and unpack
      magic, image_count = f.read(8).unpack('N2')
      # Row and column count
      rows_count, cols_count = f.read(8).unpack('N2')
      image_count.times do
        images.push f.read(28 * 28)
      end
    end
    # Put the images together with the labels
    data = images.map.with_index do |image, i|
      # target is the value we hope to get back from the neural net after training
      target = [0]*10
      target[labels[i]] = 1
      # return an image and target pair as data
      [image, target]
    end
    return data
  end
end

p FileReader.new.get_mnist_training_data.sample
