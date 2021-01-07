module Chess
  class Board

    def initialize
      @board = Array.new(8).map { Array.new(8) }
    end

    def score
      score = 0
      @board.each do |row|
        row.each do |square|
          next if square.nil?

          score += square.value
        end
      end

      score
    end
  end
end
