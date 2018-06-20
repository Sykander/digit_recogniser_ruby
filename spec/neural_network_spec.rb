RSpec.describe "Neural Network" do

  before(:all) do
    @net_class = Accessor.get_neural_network
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

      @neural_net = @net_class.model_net @input, @layers, @output
    end

    it "should return a 2d array" do
      expect( @neural_net ).to be_kind_of Array
      expect( @neural_net.sample ).to be_kind_of Array
    end

    it "should be an array of length of the layers input + 1" do
      expect( @neural_net.length ).to eq(@layers_length+1)
    end

    it "should adhere to the neural net model" do
      n = Random.new.rand(0..@layers_length)
      expect( @neural_net[n].length ).to eq @layers[n]
      expect( @neural_net[-1].length ).to eq @output
    end

  end

  context "When generating weights" do

    before(:all) do
      @weights = @net_class.gen_weights
    end

    it "should return a 3d array" do
      expect(@weights).to be_kind_of Array
      expect(@weights.sample).to be_kind_of Array
      expect(@weights.sample.sample).to be_kind_of Array
    end

    it "should contain only float values" do
      expect(@weights.sample.sample.sample).to be_a Float
      expect(@weights.sample.sample.sample).to be_a Float
      expect(@weights.sample.sample.sample).to be_a Float
    end

  end

end
