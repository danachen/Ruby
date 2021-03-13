class BeerSong
  def lyrics
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).collect { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.new(number)
    next_bottle_number = BottleNumber.new(bottle_number.successor)

    "#{bottle_number.quantity.capitalize} #{bottle_number.container} " +
    "of beer on the wall, " +
    "#{bottle_number.quantity} #{bottle_number.container} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{next_bottle_number.quantity} #{next_bottle_number.container} " +
    "of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def zero?
    number.zero?
  end

  def one?
    number == 1
  end

  def container
    send("container_when_#{one?}")
  end

  def quantity
    send("quantity_when_#{zero?}")
  end

  def action
    send("action_when_#{zero?}")
  end

  def pronoun
    send("pronoun_when_#{one?}")
  end

  def successor
    send("successor_when_#{zero?}")
  end

private
  def container_when_true
    "bottle"
  end

  def container_when_false
    "bottles"
  end

  private
  def quantity_when_true
    "no more"
  end

  def quantity_when_false
    number.to_s
  end

  def action_when_true
    "Go to the store and buy some more"
  end

  def action_when_false
    "Take #{pronoun} down and pass it around"
  end

  def pronoun_when_true
    "it"
  end

  def pronoun_when_false
    "one"
  end

  def successor_when_true
    99
  end

  def successor_when_false
    number - 1
  end
end