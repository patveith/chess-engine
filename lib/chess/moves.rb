module Chess
  module LateralMoves
    def lateral_moves(max_distance = 7)
      moves = []

      (1..max_distance).each do |i|
        moves.append([@file, i + 1])
        moves.append([(Chess::Board::CHAR_A_ASCII + i).chr, @rank])
      end

      moves
    end
  end

  module DiagonalMoves
    def diagonal_moves(max_distance = 8)
      moves = []

      max_distance.times do |i|
        if Chess::Board.on_board?(@file.ord + i + 1, @rank + i + 1)
          moves.append([(@file.ord + i + 1).chr, @rank + i + 1])
        end

        if Chess::Board.on_board?(@file.ord + i + 1, @rank - (i + 1))
          moves.append([(@file.ord + i + 1).chr, @rank - (i + 1)])
        end

        if Chess::Board.on_board?(@file.ord - (i + 1), @rank - (i + 1))
          moves.append([(@file.ord - (i + 1)).chr, @rank - (i + 1)])
        end

        if Chess::Board.on_board?(@file.ord - (i + 1), @rank + i + 1)
          moves.append([(@file.ord - (i + 1)).chr, @rank + i + 1])
        end
      end

      moves
    end
  end
end
