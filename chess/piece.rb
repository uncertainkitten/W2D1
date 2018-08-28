class Piece
  attr_accessor :render
  def initialize
    @pos = [0,0]
    @render = "p"

  end

end

class NullPiece < Piece
  attr_accessor :render

  def initialize
    @render = "d"
  end
end
