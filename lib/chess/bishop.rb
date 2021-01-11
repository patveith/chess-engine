module Chess
  class Bishop < Piece
    include DiagonalMoves

    def available_moves
      diagonal_moves.reject do |move|
        move[:rank] == @rank && move[:file] == @file
      end
    end
  end
end
