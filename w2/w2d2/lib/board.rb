class Board
  attr_accessor :cups, :sides, :players

  def initialize(name1, name2)
    @sides = {name1 => 0, name2 => 7}
    @cups = Array.new(14) {Array.new()}
    @players = [name1, name2]
    place_stones

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each.with_index do |cup, idx|
      unless idx%7 == 6
        cup.concat([:stone] * 4)
      end
    end
  end

  def valid_move?(start_pos)
    msg = "Invalid starting cup"
    raise msg unless  @cups[start_pos] && start_pos % 7 != 6
    raise msg unless @cups[start_pos].count > 0
  end

  def make_move(start_pos, current_player_name)
    hand = @cups[start_pos]
    @cups[start_pos] = []
    idx = start_pos
    offset = sides[current_player_name]
    while (stone = hand.pop)
      idx = (idx + 1) % 14
      until idx != (offset+13)%14
        idx = (idx + 1) % 14
      end
      @cups[idx] << stone
    end
    render
    next_turn(idx)

  end

  def next_turn(idx)
    return :prompt if idx%7 == 6
    return :switch if @cups[idx].count == 1
    idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    [0,7].any? do |side|
      (0..5).all? do |idx|
         @cups[side+idx].empty? || (side+idx) % 7 == 6
      end
    end
  end

  def winner
    cup1, cup2 = players.map {|name| @cups[sides[name]+6].count}
    diff = cup1-cup2
    if diff == 0
      return :draw
    elsif diff < 0
      return players.last
    else
      return players.first
    end
  end
end
