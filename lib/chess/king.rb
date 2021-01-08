module Chess
  class King < Piece
    include DiagonalMoves
    include LateralMoves

    def available_moves
      (diagonal_moves(1) + lateral_moves(1)).reject do |file, rank|
        rank == @rank && file == @file
      end
    end
  end
end
