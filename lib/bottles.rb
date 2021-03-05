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
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    else
      <<~VERSE
        #{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.
        Take #{pronoun(number)} down and pass it around, #{quantity(number-1)} #{container(number-1)} of beer on the wall.
      VERSE
    end
  end

  private

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

  def quantity(number)
    if number == 0
      'no more'
    else
      number
    end
  end
end