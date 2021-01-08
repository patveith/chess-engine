module Chess
  class Knight < Piece
    def available_moves
      ascii_file_number = file.ord

      [
        [(ascii_file_number + 1).chr, rank + 2],
        [(ascii_file_number - 1).chr, rank + 2],
        [(ascii_file_number + 1).chr, rank - 2],
        [(ascii_file_number - 1).chr, rank - 2],
        [(ascii_file_number + 2).chr, rank + 1],
        [(ascii_file_number - 2).chr, rank + 1],
        [(ascii_file_number + 2).chr, rank - 1],
        [(ascii_file_number - 2).chr, rank - 1]
      ]
    end
  end
end
