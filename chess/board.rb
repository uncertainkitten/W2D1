class Board 
  attr_reader :board 
  def initialize(board = nil)
    if board.nil?
      @board = Array.new(8) {Array.new(8){[]}}
    else 
      @board = board
    end 
    
  end 
  
  
  
end 
x = Board.new

p x.board