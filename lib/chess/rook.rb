module Chess
  class Rook < Piece
    def available_moves
      moves = []

      8.times do |i|
        moves.append([@file, i + 1])
        moves.append([(Chess::Board::CHAR_A_ASCII + i).chr, @rank])
      end

      moves.reject do |file, rank|
        rank == @rank && file == @file
      end

    end
  end
end
