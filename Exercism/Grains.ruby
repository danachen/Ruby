class Grains

  BOARD = (1..64)

  def self.square(square_num)
    raise ArgumentError if !BOARD.cover?(square_num)
    2 ** (square_num - 1)
  end

  def self.total
    2 ** BOARD.last - 1
  end

end