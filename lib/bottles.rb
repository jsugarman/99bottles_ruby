class Bottles
  def song
    verses(99, 0)
  end

  def verses(first_verse, last_verse)
    first_verse.downto(last_verse).map {|i| verse(i) }.join("\n")
  end

  def verse(number)
    <<~VERSE
      #{quantity(number).capitalize} #{container(number)} of beer on the wall, #{quantity(number)} #{container(number)} of beer.
      #{action(number)}, #{quantity(successor(number))} #{container(successor(number))} of beer on the wall.
    VERSE
  end

  private

  def quantity(number)
    if number.eql?(0)
      'no more'
    else
      number.to_s
    end
  end

  def container(number)
    if number.eql?(1)
      'bottle'
    else
      'bottles'
    end
  end

  def action(number)
    if number.eql?(0)
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def pronoun(number)
    if number.eql?(1)
      'it'
    else
      'one'
    end
  end

  def successor(number)
    if number.eql?(0)
      99
    else
      number - 1
    end
  end
end
