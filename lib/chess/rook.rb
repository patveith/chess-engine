module Chess
  class Rook < Piece
    include LateralMoves

    def available_moves
      lateral_moves.reject do |file, rank|
        rank == @rank && file == @file
      end
    end
  end
end

