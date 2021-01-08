module Chess
  module LateralMoves
    def lateral_moves
      moves = []

      8.times do |i|
        moves.append([@file, i + 1])
        moves.append([(Chess::Board::CHAR_A_ASCII + i).chr, @rank])
      end

      moves
    end
  end

  module DiagonalMoves
    def diagonal_moves
      moves = []

      8.times do |i|
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
