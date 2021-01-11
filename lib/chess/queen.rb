module Chess
  class Queen < Piece
    include DiagonalMoves
    include LateralMoves

    def available_moves
      (diagonal_moves + lateral_moves).reject do |move|
        move[:rank] == @rank && move[:file] == @file
      end
    end
  end
end
