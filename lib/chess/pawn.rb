module Chess
  class Pawn < Piece
    def available_moves(board)
      if board.piece_at_square(:file => @file, :rank => @rank + 1)
        return []
      elsif board.piece_at_square(:file => @file, :rank => @rank + 2)
        return [
          {
            :file => @file,
            :rank => @rank + 1
          }
        ]
      elsif !@moved
        return [
          {
            :file => @file,
            :rank => @rank + 2
          },
          {
            :file => @file,
            :rank => @rank + 1
          }
        ]
      else
        [
          {
            :file => @file,
            :rank => @rank + 1
          }
        ]
      end
    end
  end
end


# check for a piece in @rank + 1, or @rank + 2 if unmoved (current file)
# check for rank + 1 and file + 1 (or -1) and opposite color
