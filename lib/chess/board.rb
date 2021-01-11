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

    CHAR_A_ASCII = 97.freeze
    CHAR_H_ASCII = 104.freeze
    FILE_ASCII_CHAR_OFFSET = CHAR_A_ASCII

    def self.on_board?(file, rank)
      (1..8).include?(rank) && (CHAR_A_ASCII..CHAR_H_ASCII).include?(file.ord)
    end

    def initialize(board_matrix: nil)
      @board_matrix = board_matrix || Array.new(8).map { Array.new(8) }
      return if board_matrix

      @board_matrix.each_with_index do |row, y|
        row.each_with_index do |square, x|
          file, rank = coordinates_to_rank_and_file(x, y)
          case rank
          when 1
            @board_matrix[y][x] = Chess::Piece.new(
              :team => Chess::Piece::Team::WHITE,
              :type => WHITE_BACK_ROW_ORDER[x],
              :file => file,
              :rank => rank
            )
          when 2
            @board_matrix[y][x] = Chess::Piece.new(
              :team => Chess::Piece::Team::WHITE,
              :type => Chess::Piece::Type::PAWN,
              :file => file,
              :rank => rank
            )
          when 7
            @board_matrix[y][x] = Chess::Piece.new(
              :team => Chess::Piece::Team::BLACK,
              :type => Chess::Piece::Type::PAWN,
              :file => file,
              :rank => rank
            )
          when 8
            @board_matrix[y][x] = Chess::Piece.new(
              :team => Chess::Piece::Team::BLACK,
              :type => WHITE_BACK_ROW_ORDER.reverse[x],
              :file => file,
              :rank => rank
            )
          end
        end
      end
    end

    def piece_at_square(file:, rank:)
      x, y = rank_and_file_to_coordinates(:file => file, :rank => rank)
      @board_matrix[y][x]
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

    private

    def coordinates_to_rank_and_file(x, y)
      rank = y + 1
      file = (x + FILE_ASCII_CHAR_OFFSET).chr

      [file, rank]
    end

    def rank_and_file_to_coordinates(file:, rank:)
      y = rank - 1
      x = file.ord - FILE_ASCII_CHAR_OFFSET

      [x, y]
    end
  end
end
