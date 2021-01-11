module Chess
  class Pawn < Piece
    def available_moves(board)
      direction = @team == Chess::Piece::Team::WHITE ? 1 : -1

      if board.piece_at_square(:file => @file, :rank => @rank + direction)
        return []
      elsif board.piece_at_square(:file => @file, :rank => @rank + 2 * direction)
        return [
          {
            :file => @file,
            :rank => @rank + direction
          }
        ]
      elsif !@moved
        return [
          {
            :file => @file,
            :rank => @rank + 2 * direction
          },
          {
            :file => @file,
            :rank => @rank + direction
          }
        ]
      else
        [
          {
            :file => @file,
            :rank => @rank + direction
          }
        ]
      end
    end
  end
end
