module Chess
  class Queen < Piece
    include DiagonalMoves
    include LateralMoves

    def available_moves
      (diagonal_moves + lateral_moves).reject do |file, rank|
        rank == @rank && file == @file
      end
    end
  end
end
