class Die
  def roll
    rand(1..6)
  end
end


class Craps
  attr_accessor :first_die, :second_die

  def initialize
    @turn_count = 1
    @point_from_first_turn
    @playing = true
  end

  def first_die_roll
    first_die.roll
  end

  def second_die_roll
    second_die.roll
  end

  def first_roll?
    @turn_count == 1
  end

  def roll
    first_die_roll + second_die_roll
  end

  def turn
    while @playing
      response = status
      puts "You #{response} with points #{@point} at turn no #{@turn_count}"
      @turn_count += 1
    end
    response
  end

  def status
    @point = roll
    if first_roll? && [7,11].include?(@point)
      @playing = false
      return 'Win!!!'
    elsif first_roll? && [2,3,12].include?(@point)
      @playing = false
      return "Craps you loose"
    elsif first_roll?
      @point_from_first_turn ||= @point
      "Retry"
    elsif !first_roll? && [7,11].include?(@point)
      @playing = false
      'craps out!?'
    elsif !first_roll? && @point_from_first_turn == @point
      @playing = false
      'Win!!!'
    elsif !first_roll? && @point_from_first_turn != @point
      "Retry"
    end
  end

end
