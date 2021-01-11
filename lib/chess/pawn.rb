module Chess
  class Pawn < Piece
    def available_moves
      return [
          {
            :file => @file,
            :rank => @rank + 2
          },
          {
            :file => @file,
            :rank => @rank + 1
          }
        ] unless @moved
      [
        {
          :file => @file,
          :rank => @rank + 1
        }
    ]
    end
  end
end
