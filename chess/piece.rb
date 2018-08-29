require_relative '00_tree_node.rb'


module Slidable
  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []


  def horizontal_dirs
    # result = []
    # for i in (0..7)
    #   result << [i,0]
    #   result << [0,i]
    # end
    return HORIZONTAL_DIRS
  end

  def diagonal_dirs
  end

  def moves
  end

private
  def move_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end
end

module Steppable
  def moves
  end
end


class Piece
  attr_accessor :color, :position, :symbol

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
  attr_accessor :color, :symbol

  # include Singleton

  def initialize
  end
end

class Bishop < Piece
  include Slidable

  def initialize
  end

  def move_dirs
  end
end

class Queen < Piece
  include Slidable

  def initialize
  end

  def move_dirs
  end
end

class Rook < Piece
  include Slidable

  def initialize
  end

  def move_dirs
  end
end

class King
  include Steppable

  def initialize
  end

  def move_diff
  end
end

class Knight
  include Steppable

  def initialize
  end

  def move_diff
  end
end
