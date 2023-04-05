module Chess
  class Pawn < Piece
    def available_moves(board)
      direction = @team == Chess::Piece::Team::WHITE ? 1 : -1

      moves = []
      if Chess::Board.on_board?(file_shift(1), @rank + direction) && board.piece_at_square(:file => file_shift(1), :rank => @rank + direction)
        moves.append(
          {
            :file => file_shift(1),
            :rank => @rank + direction
          }
        )
      end
      if Chess::Board.on_board?(file_shift(-1), @rank + direction) && board.piece_at_square(:file => file_shift(-1), :rank => @rank + direction)
        moves.append(
          {
            :file => file_shift(-1),
            :rank => @rank + direction
          }
        )
      end

      if board.piece_at_square(:file => @file, :rank => @rank + direction)
        moves
      elsif board.piece_at_square(:file => @file, :rank => @rank + 2 * direction)
        return moves.append(
          {
            :file => @file,
            :rank => @rank + direction
          }
        )
      elsif !@moved
        moves.append(
          {
            :file => @file,
            :rank => @rank + 2 * direction
          }
        )
        moves.append(
          {
            :file => @file,
            :rank => @rank + direction
          }
        )
      else
        moves.append(
          {
            :file => @file,
            :rank => @rank + direction
          }
        )
      end
    end
  end
end
