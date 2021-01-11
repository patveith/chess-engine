module Chess
  class Knight < Piece
    def available_moves
      ascii_file_number = file.ord

      moves = [
        {
          :file => (ascii_file_number + 1).chr,
          :rank => @rank + 2
        },
        {
          :file => (ascii_file_number - 1).chr,
          :rank => @rank + 2
        },
        {
          :file => (ascii_file_number + 1).chr,
          :rank => @rank - 2
        },
        {
          :file => (ascii_file_number - 1).chr,
          :rank => @rank - 2
        },
        {
          :file => (ascii_file_number + 2).chr,
          :rank => @rank + 1
        },
        {
          :file => (ascii_file_number - 2).chr,
          :rank => @rank + 1
        },
        {
          :file => (ascii_file_number + 2).chr,
          :rank => @rank - 1
        },
        {
          :file => (ascii_file_number - 2).chr,
          :rank => @rank - 1
        }
      ]

      moves.select do |move|
        Chess::Board.on_board?(move[:file], move[:rank])
      end
    end
  end
end
