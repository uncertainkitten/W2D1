require 'colorize'
require_relative 'board.rb'
require_relative 'cursor.rb'

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    curs_pos = @cursor.cursor_pos
    @board.board.each do |el|
      el.each do |piece|
        puts piece unless piece == @board[curs_pos]
        puts @board[curs_pos].render.colorize(:blue)
      end
    end
    # puts @board[pos].render.colorize(:blue)
    @cursor.get_input
  end

end
