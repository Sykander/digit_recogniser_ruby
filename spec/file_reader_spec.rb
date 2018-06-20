RSpec.describe "Read in and format training data" do

  before(:all) do
    @file = Accessor.get_file_reader
  end

  context "when getting the training data" do

    before(:all) do
      @file.get_mnist_training_data
    end

    it "should return an array 60,000" do
      expect(@file.training_data.length).to eq 60000
    end

    it "should contain a string array pair in each entry" do
      expect(@file.training_data.sample).to be_kind_of Array
      expect(@file.training_data.sample[0]).to be_kind_of String
      expect(@file.training_data.sample[1]).to be_kind_of Array
    end

    it "should contain a string of length 28^2" do
      expect(@file.training_data.sample[0].length).to eq 28**2
    end

    it "should contain an array of 10 values" do
      expect(@file.training_data.sample[1].length).to eq 10
    end

  end

  context "when formatting the image data" do

    before(:all) do
      image = @file.get_mnist_training_data.sample.first
      @formatted_image = @file.format_image image
    end

    it "should return an array of length 28^2" do
      expect(@formatted_image).to be_kind_of Array
      expect(@formatted_image.length).to eq 28**2
    end

    it "should contain only the values 0 and 1" do
      expect(@formatted_image.sample).to eq(0).or eq(1)
      expect(@formatted_image.sample).to eq(0).or eq(1)
      expect(@formatted_image.sample).to eq(0).or eq(1)
    end

  end

end
