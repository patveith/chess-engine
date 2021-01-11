module Chess
  class Knight < Piece
    def available_moves(board)
      moves = []

      l_movements = [
        {
          :file_shift => 1,
          :rank_shift => 2
        },
        {
          :file_shift => -1,
          :rank_shift => 2
        },
        {
          :file_shift => 1,
          :rank_shift => -2
        },
        {
          :file_shift => -1,
          :rank_shift => -2
        },
        {
          :file_shift => 2,
          :rank_shift => 1
        },
        {
          :file_shift => -2,
          :rank_shift => 1
        },
        {
          :file_shift => 2,
          :rank_shift => -1
        },
        {
          :file_shift => -2,
          :rank_shift => -1
        }
      ]

      l_movements.each do |move|
        next if !Chess::Board.on_board?(
          file_shift(move[:file_shift]),
          @rank + move[:rank_shift]
        )

        piece_at_location = board.piece_at_square(
          :file => file_shift(move[:file_shift]),
          :rank => @rank + move[:rank_shift]
        )

        moves.append(
          {
            :file => file_shift(move[:file_shift]),
            :rank => @rank + move[:rank_shift]
          }
        ) unless piece_at_location && piece_at_location.team == @team
      end

      moves
    end
  end
end
