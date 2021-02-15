require 'active_support/inflector'

class Bottles
  def initialize
  end

  def verse(verse_number)
    current_bottle = verse_number
    next_bottle = (current_bottle.eql?(0) ? 99 : current_bottle - 1)
    bottle_number_text = number_to_text(current_bottle)

    next_bottle_number_text = number_to_text(next_bottle)
    bottle_word = 'bottle'.pluralize(current_bottle)
    next_bottle_word = 'bottle'.pluralize(next_bottle)

    "#{bottle_number_text} #{bottle_word} of beer on the wall, ".humanize +
    "#{bottle_number_text} #{bottle_word} of beer.\n" +
    third_sentence(verse_number) +
    "#{next_bottle_number_text} #{next_bottle_word} of beer on the wall.\n"
  end

  def verses(first, last)
    (last..first).to_a.reverse.each_with_object([]) do|number, arr|
      arr << verse(number)
    end.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def number_to_text(num)
    num.zero? ? 'no more' : num
  end

  def it_or_one(num)
    num.eql?(1) ? 'it' : 'one'
  end

  def third_sentence(num)
    if num.zero?
      "Go to the store and buy some more, "
    else
      "Take #{it_or_one(num)} down and pass it around, "
    end
  end
end
