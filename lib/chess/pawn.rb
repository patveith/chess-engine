module Chess
  class Pawn < Piece
    def available_moves
      return [[@file, @rank + 2], [@file, @rank + 1]] unless @moved
      [[@file, @rank + 1]]
    end
  end
end
