require 'craps'

describe Craps do
  let(:craps) { Craps.new }
  it "wins if rolls a 7 on the first roll" do
    craps.stub(:first_die_roll).and_return(3)
    craps.stub(:second_die_roll).and_return(4)
    expect(craps.roll).to eq 7
  end

  it "expects first_roll should be true" do
    expect(craps.first_roll?).to be_true
  end

  it "expects first_roll should be false if turn_count is not 1" do
    craps.instance_variable_set(:@turn_count, 2)
    expect(craps.first_roll?).to be_false
  end

  it "expect a 11 on the first roll" do
    craps.stub(:first_die_roll).and_return(5)
    craps.stub(:second_die_roll).and_return(6)
    expect(craps.roll).to eq 11
  end

  it "status should be 'Win!!!'' if it is 11 on first_roll" do
    craps.stub(:first_die_roll).and_return(5)
    craps.stub(:second_die_roll).and_return(6)
    expect(craps.status).to eq 'Win!!!'
  end

  it "status should be 'Win!!!'' if it is 7 on first_roll" do
    craps.stub(:first_die_roll).and_return(1)
    craps.stub(:second_die_roll).and_return(6)
    expect(craps.status).to eq 'Win!!!'
  end

  it "status should be 'Craps you loose' if it is 2" do
    craps.stub(:first_die_roll).and_return(1)
    craps.stub(:second_die_roll).and_return(1)
    expect(craps.status).to eq 'Craps you loose'
  end

  it "status should be 'Craps you loose' if it is 3" do
    craps.stub(:first_die_roll).and_return(1)
    craps.stub(:second_die_roll).and_return(2)
    expect(craps.status).to eq 'Craps you loose'
  end

  it "status should be 'Craps you loose' if it is 12" do
    craps.stub(:first_die_roll).and_return(6)
    craps.stub(:second_die_roll).and_return(6)
    expect(craps.status).to eq 'Craps you loose'
  end

  it "status should be 'craps out!?', if  7 on a turn other than the first turn" do
    craps.instance_variable_set(:@turn_count, 2)
    craps.stub(:first_die_roll).and_return(1)
    craps.stub(:second_die_roll).and_return(6)
    expect(craps.status).to eq 'craps out!?'
  end

  it "status should be 'craps out!?', if  11 on a turn other than the first turn" do
    craps.instance_variable_set(:@turn_count, 2)
    craps.stub(:first_die_roll).and_return(5)
    craps.stub(:second_die_roll).and_return(6)
    expect(craps.status).to eq 'craps out!?'
  end

  it "status should be 'Win!!!'' if  point_from_first_turn equals current roll" do
    craps.instance_variable_set(:@turn_count, 7)
    craps.instance_variable_set(:@point_from_first_turn, 6)
    craps.stub(:first_die_roll).and_return(5)
    craps.stub(:second_die_roll).and_return(1)
    expect(craps.status).to eq 'Win!!!'
  end

  it "status should be 'Retry' if roll is not 7,11 and roll is not equal to point_from_first_turn" do
    craps.instance_variable_set(:@turn_count, 5)
    craps.instance_variable_set(:@point_from_first_turn, 8)
    craps.stub(:first_die_roll).and_return(2)
    craps.stub(:second_die_roll).and_return(4)
    expect(craps.status).to eq 'Retry'
  end

  it "status should return 'craps out!?' if point_from_first_turn = 6 and roll = 7" do
    craps.instance_variable_set(:@turn_count, 5)
    craps.instance_variable_set(:@point_from_first_turn, 6)
    craps.stub(:first_die_roll).and_return(3)
    craps.stub(:second_die_roll).and_return(4)
    expect(craps.status).to eq 'craps out!?'
  end

  it "status should return 'craps out!?' if point_from_first_turn = 5 and roll = 11" do
    craps.instance_variable_set(:@turn_count, 19)
    craps.instance_variable_set(:@point_from_first_turn, 5)
    craps.stub(:first_die_roll).and_return(5)
    craps.stub(:second_die_roll).and_return(6)
    expect(craps.status).to eq 'craps out!?'
  end

  describe "Testing playing" do
    it "should return a string" do
      craps.first_die = Die.new
      craps.second_die = Die.new
      turn = craps.turn
      array_of_expected_responses = ['Win!!!', 'Craps you loose', 'craps out!?']
      array_of_expected_responses.should include turn
    end

    it "expect @playing to be default to false" do
      expect(craps.instance_variable_get(:@playing)).to be_true
    end

  end
end
