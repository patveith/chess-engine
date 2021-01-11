module Chess
  class Rook < Piece
    include LateralMoves

    def available_moves
      lateral_moves.reject do |move|
        move[:rank] == @rank && move[:file] == @file
      end
    end
  end
end

