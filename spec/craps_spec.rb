require 'craps'

describe Craps do
  describe "first roll" do
    it "wins if rolls a 7" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(3)
      die2 = Die.new
      die2.stub(:roll).and_return(4)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(output).to have_received(:puts).with("'natural' roll, you WIN!")
    end

    it "wins if rolls a 11" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(3)
      die2 = Die.new
      die2.stub(:roll).and_return(4)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(output).to have_received(:puts).with("'natural' roll, you WIN!")
    end

    it "loses if rolls a 2" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(1)
      die2 = Die.new
      die2.stub(:roll).and_return(1)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(output).to have_received(:puts).with("'craps!' you LOSE!")
    end

    it "loses if rolls a 3" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(1)
      die2 = Die.new
      die2.stub(:roll).and_return(2)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(output).to have_received(:puts).with("'craps!' you LOSE!")
    end

    it "loses if rolls a 12" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(6)
      die2 = Die.new
      die2.stub(:roll).and_return(6)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(output).to have_received(:puts).with("'craps!' you LOSE!")
    end
  end
end
