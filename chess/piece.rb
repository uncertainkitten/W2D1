class Piece
  attr_accessor :render

  def initialize(board)
    @pos = [0,0]
    @color = "p"
    @board = board
  end

  def moves
  end

  def to_s
  end

  def empty?
  end

  def valid_moves
  end

  def pos=(val)
  end

  def symbol
  end

  private

  def move_into_check?(end_pos)
  end
end

class NullPiece < Piece
  attr_accessor :render
  include Singleton
  def initialize
    @render = "d"
  end
end

module SlidingPiece
  def initialize
  end

  def moves
  end

  def move_dirs
  end
end

module SteppingPiece
end
