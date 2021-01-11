require "spec_helper"

RSpec.describe Chess::Board do
  describe ".on_board?" do
    context "when rank and file are on the board" do
      it "returns true" do
        expect(described_class.on_board?("c", 5)).to eq(true)
      end
    end

    context "when rank and file both not on the board" do
      it "returns false" do
        expect(described_class.on_board?("i", 9)).to eq(false)
      end
    end

    context "when rank is on the board and file is not" do
      it "returns false" do
        expect(described_class.on_board?("i", 5)).to eq(false)
      end
    end

    context "when file is on the board and rank is not" do
      it "returns false" do
        expect(described_class.on_board?("c", 9)).to eq(false)
      end
    end
  end

  describe "#new" do
    subject { described_class.new }

    context "when creating a new board" do
      let(:board_matrix) do
        [
          [
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK, :file => "a", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KNIGHT, :file => "b", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP, :file => "c", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::QUEEN, :file => "d", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KING, :file => "e", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP, :file => "f", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KNIGHT, :file => "g", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK, :file => "h", :rank => 1)
          ],
          [
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "a", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "b", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "c", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "d", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "e", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "f", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "g", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "h", :rank => 2)
          ],
          Array.new(8),
          Array.new(8),
          Array.new(8),
          Array.new(8),
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "a", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "b", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "c", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "d", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "e", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "f", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "g", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "h", :rank => 7)
          ],
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK, :file => "a", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT, :file => "b", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP, :file => "c", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KING, :file => "d", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::QUEEN, :file => "e", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP, :file => "f", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT, :file => "g", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK, :file => "h", :rank => 8)
          ],
        ]
      end

      it "puts the pieces in the correct place" do
        expect(subject.board_matrix).to eq(board_matrix)
      end
    end

    context "when passing in a board_matrix" do
      subject { described_class.new(:board_matrix => board_matrix) }

      let(:board_matrix) do
        [
          [
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK, :file => "a", :rank => 1),
            nil,
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP, :file => "c", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::QUEEN, :file => "d", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KING, :file => "e", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP, :file => "f", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KNIGHT, :file => "g", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK, :file => "h", :rank => 1)
          ],
          [
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "a", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "b", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "c", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "d", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "e", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "f", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "g", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "h", :rank => 2)
          ],
          [nil, Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KNIGHT, :file => "b", :rank => 3), nil, nil, nil, nil, nil, nil],
          Array.new(8),
          Array.new(8),
          Array.new(8),
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "a", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "b", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "c", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "d", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "e", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "f", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "g", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "h", :rank => 7)
          ],
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK, :file => "a", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT, :file => "b", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP, :file => "c", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KING, :file => "d", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::QUEEN, :file => "e", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP, :file => "f", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT, :file => "g", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK, :file => "h", :rank => 8)
          ],
        ]
      end

      it "creates the board with that board_matrix" do
        expect(subject.board_matrix).to eq(board_matrix)
      end
    end
  end

  describe "#score" do
    subject { described_class.new }

    context "when no pieces have been taken" do
      it "returns a score of 0" do
        expect(subject.score).to eq(0)
      end
    end

    context "when black has taken a knight" do
      subject { described_class.new(:board_matrix => board_matrix) }

      let(:board_matrix) do
        [
          [
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK, :file => "a", :rank => 1),
            nil,
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP, :file => "c", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::QUEEN, :file => "d", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KING, :file => "e", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP, :file => "f", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KNIGHT, :file => "g", :rank => 1),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK, :file => "h", :rank => 1)
          ],
          [
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "a", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "b", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "c", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "d", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "e", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "f", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "g", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "h", :rank => 2)
          ],
          Array.new(8),
          Array.new(8),
          Array.new(8),
          Array.new(8),
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "a", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "b", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "c", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "d", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "e", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "f", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "g", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "h", :rank => 7)
          ],
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK, :file => "a", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT, :file => "b", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP, :file => "c", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KING, :file => "d", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::QUEEN, :file => "e", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP, :file => "f", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT, :file => "g", :rank => 8),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK, :file => "h", :rank => 8)
          ],
        ]
      end

      it "black has a score advantage" do
        expect(subject.score).to eq(-3)
      end
    end
  end

  describe "#piece_at_square" do
    subject { described_class.new }

    context "when asking for a piece at a location on a board" do
      let(:king) do
        Chess::Piece.new(:team => Chess::Piece::Team::WHITE,
          :type => Chess::Piece::Type::KING,
          :file => "e",
          :rank => 1
        )
      end

      it "returns that piece object" do
        expect(subject.piece_at_square(:file => "e", :rank => 1)).to eq(king)
      end
    end

  end
end
