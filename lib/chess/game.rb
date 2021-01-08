module Chess
  class Game
    def initialize
      @board = Chess::Board.new
      @player1 = Chess::Player.new(team: => Chess::Board::WHITE)
      @player2 = Chess::Player.new(team: => Chess::Board::BLACK)
      @done = false
    end

    def start
      while !@done
        [@player1, @player2].each do |player|
          player.make_a_move(@board)
        end
      end
    end
  end
end