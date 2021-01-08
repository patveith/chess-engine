module Chess
  class Knight < Piece
    def available_moves
      ascii_file_number = file.ord

      moves = [
        [(ascii_file_number + 1).chr, rank + 2],
        [(ascii_file_number - 1).chr, rank + 2],
        [(ascii_file_number + 1).chr, rank - 2],
        [(ascii_file_number - 1).chr, rank - 2],
        [(ascii_file_number + 2).chr, rank + 1],
        [(ascii_file_number - 2).chr, rank + 1],
        [(ascii_file_number + 2).chr, rank - 1],
        [(ascii_file_number - 2).chr, rank - 1]
      ]

      moves.reject do |file, rank|
        file.ord < Chess::Board::CHAR_A_ASCII ||
          file.ord > Chess::Board::CHAR_H_ASCII ||
          rank < 1 ||
          rank > 8
      end
    end
  end
end
