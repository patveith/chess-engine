module Chess
  class Bishop < Piece
    def available_moves
      moves = []

      8.times do |i|
        if is_on_board?(@file.ord + i + 1, @rank + i + 1)
          moves.append([(@file.ord + i + 1).chr, @rank + i + 1])
        end
        if is_on_board?(@file.ord + i + 1, @rank - (i + 1))
          moves.append([(@file.ord + i + 1).chr, @rank - (i + 1)])
        end
        if is_on_board?(@file.ord - (i + 1), @rank - (i + 1))
          moves.append([(@file.ord - (i + 1)).chr, @rank - (i + 1)])
        end
        if is_on_board?(@file.ord - (i + 1), @rank + i + 1)
          moves.append([(@file.ord - (i + 1)).chr, @rank + i + 1])
        end
      end

      moves.reject do |file, rank|
        rank == @rank && file == @file
      end
    end

    private

    def is_on_board?(file, rank)
      (1..8).include?(rank) && (Chess::Board::CHAR_A_ASCII..Chess::Board::CHAR_H_ASCII).include?(file.ord)
    end
  end
end
