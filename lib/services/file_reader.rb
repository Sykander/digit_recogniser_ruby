require "zlib"
class FileReader

  # Paths to the data
  TRAINING_LABELS_PATH = './lib/resources/train-labels-idx1-ubyte.gz'
  TRAINING_IMAGES_PATH = './lib/resources/train-images-idx3-ubyte.gz'

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
        images.push f.read(rows_count * cols_count)
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
    @training_data = data
    return data
  end

  def print_image index
    image = @training_data[index].first
    image = image.split ''
    i=0
    while i<28
      j=0
      while j<28
        if image[i*28 + j] == image[0]
          print '_'
        else
          print '#'
        end
        j += 1
      end
      puts ''
      i += 1
    end
  end
end
