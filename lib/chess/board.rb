module Chess
  class Board
    attr_reader :board_matrix

    WHITE_BACK_ROW_ORDER = [
      Chess::Piece::Type::ROOK,
      Chess::Piece::Type::KNIGHT,
      Chess::Piece::Type::BISHOP,
      Chess::Piece::Type::QUEEN,
      Chess::Piece::Type::KING,
      Chess::Piece::Type::BISHOP,
      Chess::Piece::Type::KNIGHT,
      Chess::Piece::Type::ROOK
    ].freeze

    def initialize(board_matrix: nil)
      @board_matrix = board_matrix || Array.new(8).map { Array.new(8) }
      return if board_matrix

      @board_matrix.each_with_index do |row, rank|
        row.each_with_index do |square, file|
          case rank
          when 0
            @board_matrix[rank][file] = Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => WHITE_BACK_ROW_ORDER[file])
          when 1
            @board_matrix[rank][file] = Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN)
          when 6
            @board_matrix[rank][file] = Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN)
          when 7
            @board_matrix[rank][file] = Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => WHITE_BACK_ROW_ORDER.reverse[file])
          end
        end
      end
    end

    def score
      score = 0
      @board_matrix.each do |row|
        row.each do |square|
          next if square.nil?

          score += square.value
        end
      end

      score
    end
  end
end
