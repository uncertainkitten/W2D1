class Board 
  attr_reader :board 
  def initialize(board = nil)
    # fill_row = Array.new(8) {Piece.new}
    # empty_row = Array.new(8) {[]}
    if board.nil?
      @board =  Array.new(8) {Array.new(8){[]}}
      populate
    else 
      @board = board
    end 
  end 
  
  def populate
    # @board[0] = Array.new(8) {Piece.new}
    # @board[1] = Array.new(8) {Piece.new}
    # @board[6] = Array.new(8) {Piece.new}
    # @board[7] = 
    
    @board.each_with_index do |el,idx|
      if (idx < 2) || (idx > 5)
        board[idx] = Array.new(8) {Piece.new}
      else
        board[idx] = Array.new(8) {NullPiece.new}
      end
    end
  end 
end 

class Piece 
  
  def initialize 
  end 
  
end 

class NullPiece < Piece
  def initialize 
  end 
end

x = Board.new
p x.board