require './lib/dice'

class Turn
  def initialize
    self.playing = true
    self.first_roll = true
  end

  def over?
    !playing?
  end

  def play(dice_roll)
    self.dice_roll = dice_roll
    if first_roll?
      self.first_roll = false
      play_first_roll
    else
      play_subsequent_roll
    end
  end

  def not_playing
    self.playing = false
  end

  def play_first_roll
    if first_roll_win?
      not_playing
      "'natural' roll, you WIN!"
    elsif first_roll_lose?
      not_playing
      "'craps!' you LOSE!"
    else
      set_point
      "set point is #{point}"
    end
  end

  def play_subsequent_roll
    if subsequent_roll_lose?
      not_playing
      "you crapped out with a #{dice_roll}"
    elsif subsequent_roll_win?
      not_playing
      "you win with #{point}"
    else
      "Roll again"
    end
  end

  def set_point
    self.point = dice_roll
  end

  def subsequent_roll_win?
    dice_roll == point
  end

  def subsequent_roll_lose?
    dice_roll == 7
  end

  def first_roll_win?
    [7, 11].include? dice_roll
  end

  def first_roll_lose?
    [2, 3, 12].include? dice_roll
  end

  def first_roll?
    first_roll
  end

  def playing?
    playing
  end

  attr_accessor :playing, :point, :first_roll, :dice_roll
end

class Craps
  def initialize output
    self.output = output
    self.dice = Dice.new(2)
  end

  def game_loop
    turn = Turn.new
    until turn.over?
      roll_dice
      display "current roll is #{dice_roll}"
      turn.dice_roll = dice_roll
      roll_message = turn.play(dice_roll)
      display roll_message
    end
  end

  private

  def display message
    output.puts message
  end

  def roll_dice
    dice.roll
  end

  def dice_roll
    dice.sum
  end

  attr_accessor :output, :dice
end
