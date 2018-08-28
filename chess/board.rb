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
        board[idx] = Array.new(8) {Piece.new(self)}
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

    return self[end_pos]
  end

  def off_board?(pos)
    return pos.any? { |el| el < 0 || el > 7 }
  end

  def valid_pos?(pos)
    raise InvalidMove, "Out of bounds" if off_board?(pos)
    !off_board?(pos)
  end


  def is_valid?(start_pos, end_pos)
    begin
      raise InvalidMove, "Out of bounds starting position" if off_board?(start_pos)
      raise InvalidMove, "Out of bounds ending position" if off_board?(end_pos)
      raise MissingPiece, "No piece!" if self[start_pos].class == NullPiece
      # raise InvalidMove, "Already piece in square" unless self[end_pos].class == NullPiece
      # raise InvalidMove, "Piece doesn't move that way!" if piece.valid_move(start_pos, end_pos)
    end

    return true
  end

end



class InvalidMove < ArgumentError
end

class MissingPiece < ArgumentError
end

# x = Board.new
#
# x.move_piece([1,1],[2,1])
# p x.board[2][1]
# p x.board[1][1]
# p x.board
