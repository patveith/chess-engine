module Chess
  class Board
    WHITE = "White".freeze
    BLACK = "Black".freeze

    def initialize
      @board = Array.new(8).map { Array.new(8) }
    end

    def score(team:)
      score = 0
      @board.each do |row|
        row.each do |square|
          next if square.nil?
        end
      end

      score
    end
  end
end
