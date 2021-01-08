module Chess
  class Bishop < Piece
    include DiagonalMoves

    def available_moves
      diagonal_moves.reject do |file, rank|
        rank == @rank && file == @file
      end
    end
  end
end
