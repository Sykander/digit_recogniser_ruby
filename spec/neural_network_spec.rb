RSpec.describe "Neural Network" do

  before(:all) do
    @net_class = Accessor.get_neural_network
  end

  context "When computing Sigmoid" do

    it "should return a float" do
      expect(@net_class.sigmoid 1000).to be <= 1
      expect(@net_class.sigmoid 100).to be <= 1
      expect(@net_class.sigmoid 10).to be <= 1
      expect(@net_class.sigmoid 0).to eq 0.5
      expect(@net_class.sigmoid -10).to be >= 0
      expect(@net_class.sigmoid -100).to be >= 0
      expect(@net_class.sigmoid -1000).to be >= 0
    end

  end

  context "When modelling a neural network" do

    before(:all) do
      @gen = Random.new
      @input = @gen.rand(0..20)
      @layers_length = @gen.rand(1..20)
      @output = @gen.rand(0..20)

      @layers = []
      @layers_length.times do
        @layers.push @gen.rand(0..20)
      end

      @net_class.model_net(@input.dup, @layers.dup, @output.dup)
    end

    it "should return a 2d array" do
      expect( @net_class.model_net(@input.dup, @layers.dup, @output.dup) ).to be_kind_of Array
      expect( @net_class.model_net(@input.dup, @layers.dup, @output.dup) ).to all(be_kind_of Array)
    end

    it "should be an array of length of the layers input + 1" do
      expect( @net_class.model_net(@input.dup, @layers.dup, @output.dup).length ).to eq(@layers_length+1)
    end

    it "should adhere to the neural net model" do
      n = Random.new.rand(0..@layers_length)
      expect( @net_class.model_net(@input.dup, @layers.dup, @output.dup)[n].length ).to eq @layers[n]
      expect( @net_class.model_net(@input.dup, @layers.dup, @output.dup)[-1].length ).to eq @output
    end

  end

  context "When generating weights" do

    it "should return a 3d array" do
      expect(@net_class.gen_weights).to be_kind_of Array
      expect(@net_class.gen_weights).to all(be_kind_of Array)
      expect(@net_class.gen_weights.sample).to all(be_kind_of Array)
    end

    it "should contain only float values" do
      expect(@weights.sample.sample.sample).to be_a Float
      expect(@weights.sample.sample.sample).to be_a Float
      expect(@weights.sample.sample.sample).to be_a Float
    end

  end

  context "When generating biasses" do

    before(:all) do
      @biasses = @net_class.gen_biasses
    end

    it "should return a 2d array" do
      expect(@biasses).to be_kind_of Array
      expect(@biasses.sample).to be_kind_of Array
      expect(@biasses.sample.sample).not_to be_kind_of Array
    end

    it "should contain only float values" do
      expect(@biasses.sample.sample).to be_a Float
      expect(@biasses.sample.sample).to be_a Float
      expect(@biasses.sample.sample).to be_a Float
    end

  end

  context "When making a prediction" do

    before(:all) do
      @gen = Random.new
      @input = @gen.rand(0..20)
      @layers_length = @gen.rand(1..20)
      @output = @gen.rand(0..20)

      @layers = []
      @layers_length.times do
        @layers.push @gen.rand(0..20)
      end

      @neural_net = @net_class.model_net @input, @layers, @output
      @net_class.gen_weights
      @net_class.gen_biasses

      formatted_image = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      @outputs_count = @net_class.outputs_count

      @prediction = @net_class.make_prediction formatted_image
      @neural_net = @net_class.neural_net
    end

    it "should populate the neural net with values from the prediction computation" do
      expect(@neural_net).to all(all(be_a Float))
    end

    it "should return an array of length equal to the output" do
      puts @prediction
      puts @neural_net
      expect(@prediction).to be_kind_of Array
      expect(@prediction.length).to eq @outputs_count
    end

    it "should return only floats in the range 0 to 1" do
      expect(@prediction).to all(be_a Float)
      expect(@prediction).to all(be_between(0, 1).inclusive)
    end

  end

end
