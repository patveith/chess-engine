module Chess
  class Bishop < Piece
    def available_moves
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

      moves.reject do |file, rank|
        rank == @rank && file == @file
      end
    end
  end
end
