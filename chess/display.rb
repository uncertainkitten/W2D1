require 'byebug'
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
      el.each_with_index do |piece, idx|
        if piece == @board[curs_pos]
          print @board[curs_pos].render.colorize(:red)
        elsif idx == 7
          puts piece.render
        else
          print piece.render
        end
      end
    end
    # puts @board[pos].render.colorize(:blue)
    curs_pos = nil
    @cursor.get_input
  end

  def render_loop
    p "ctr-c to exit"
    while true
      render
      puts "---"
    end
  end

end
