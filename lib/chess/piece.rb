module Chess
  class Piece
    attr_reader :team, :type, :rank, :file

    module Team
      WHITE = "White".freeze
      BLACK = "Black".freeze
    end

    module Type
      PAWN = "Pawn".freeze
      KNIGHT = "Knight".freeze
      BISHOP = "Bishop".freeze
      ROOK = "Rook".freeze
      QUEEN = "Queen".freeze
      KING = "King".freeze
    end

    module Value
      VALUES = {
        Type::PAWN => 1,
        Type::KNIGHT => 3,
        Type::BISHOP => 3,
        Type::ROOK => 5,
        Type::QUEEN => 9,
        Type::KING => 0
      }.freeze
    end

    def initialize(team:, type:, rank:, file:)
      @team = team
      @type = type
      @rank = rank
      @file = file
    end

    def ==(other_object)
      @team == other_object.team &&
        @type == other_object.type &&
        @rank == other_object.rank &&
        @file == other_object.file
    end

    def value
      raise unless Value::VALUES.key?(@type)
      @team == Team::WHITE ? Value::VALUES[@type] : -Value::VALUES[@type]
    end
  end
end
