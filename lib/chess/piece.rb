module Chess
  class Piece
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
        Type::KING => nil
      }.freeze
    end

    def initialize(team:, type:)
      @team = team
      @type = type
    end

    def value
      raise unless Value::VALUES.key?(@type)
      @team == Team::WHITE ? Value::VALUES[@type] : -Value::VALUES[@type]
    end
  end
end
