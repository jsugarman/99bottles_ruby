class Bottles
  def song
    verses(99, 0)
  end

  def verses(first_verse, last_verse)
    first_verse.downto(last_verse).map {|i| verse(i) }.join("\n")
  end

  def verse(number)
    case number
    when 0
      <<~VERSE
        #{quantity(number).capitalize} #{container(number)} of beer on the wall, #{quantity(number)} #{container(number)} of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    else
      <<~VERSE
        #{quantity(number).capitalize} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.
        Take #{pronoun(number)} down and pass it around, #{quantity(number-1)} #{container(number-1)} of beer on the wall.
      VERSE
    end
  end

  private

  def quantity(number)
    if number == 0
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

  def pronoun(number)
    if number.eql?(1)
      'it'
    else
      'one'
    end
  end
end
