require 'active_support/inflector'

class Bottles
  def initialize
  end

  attr_accessor :current_bottle

  def verse(number)
    self.current_bottle = number

    "#{current_bottle_number_prefix} of beer on the wall, ".humanize +
    "#{current_bottle_number_prefix} of beer.\n" +
    third_sentence(number) +
    "#{next_bottle_number_prefix} of beer on the wall.\n"
  end

  def verses(max, min)
    max.downto(min).map { |number| verse(number) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def current_bottle_number_prefix
    "#{current_bottle_number_text } #{current_bottle_word}"
  end

  def current_bottle_number_text
    number_to_text(current_bottle)
  end

  def current_bottle_word
    'bottle'.pluralize(current_bottle)
  end

  def next_bottle_number_prefix
    "#{next_bottle_number_text} #{next_bottle_word}"
  end

  def next_bottle_number_text
    number_to_text(next_bottle)
  end

  def next_bottle_word
    'bottle'.pluralize(next_bottle)
  end

  def next_bottle
    current_bottle.eql?(0) ? 99 : current_bottle - 1
  end

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
