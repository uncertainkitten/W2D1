class Board
  require 'byebug'
  attr_reader :board
  def initialize(board = nil)
    # fill_row = Array.new(8) {Piece.new}
    # empty_row = Array.new(8) {[]}
    if board.nil?
      @board =  Array.new(8) {Array.new(8){NullPiece.new}}
      populate
    else
      @board = board
    end
  end

  def populate
    @board.each_with_index do |el,idx|
      if (idx < 2) || (idx > 5)
        board[idx] = Array.new(8) {Piece.new}
      end
    end
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos,piece)
    x, y = pos
    @board[x][y] = piece
  end

  def move_piece(start_pos, end_pos)
    if is_valid?(start_pos, end_pos)
      held_piece = self[start_pos]
      move_to = self[end_pos]
      self[start_pos]= move_to
      self[end_pos]= held_piece
    end
  end

  def is_valid?(start_pos, end_pos)
    begin
      raise MissingPiece, "No piece!" if start_pos.class == NullPiece
      raise InvalidMove, "Out of bounds on row" if (end_pos[0] > 7) || (end_pos[0] < 0)
      raise InvalidMove, "Out of bounds on column" if (end_pos[1] > 7) || (end_pos[1] < 0)
      raise InvalidMove, "Already piece in square" unless self[end_pos].class == NullPiece
      # raise InvalidMove, "Piece doesn't move that way!" if piece.valid_move(start_pos, end_pos)
    end

    return true
  end

end

class Piece

  def initialize
    @pos = [0,0]
  end

end

class NullPiece < Piece
  def initialize
  end
end

class InvalidMove < ArgumentError
end

class MissingPiece < ArgumentError
end

x = Board.new

x.move_piece([1,1],[2,1])
p x.board[2][1]
p x.board[1][1]
# p x.board
