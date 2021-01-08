require "spec_helper"

RSpec.describe Chess::Board do
  describe "#new" do
    subject { described_class.new }

    context "when creating a new board" do
      let(:board_matrix) do
        [
          [
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KNIGHT),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::QUEEN),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KING),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KNIGHT),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK)
          ],
          Array.new(8) { Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN) },
          Array.new(8),
          Array.new(8),
          Array.new(8),
          Array.new(8),
          Array.new(8) { Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN) },
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KING),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::QUEEN),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK)
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
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK),
            nil,
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::QUEEN),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KING),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KNIGHT),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK)
          ],
          Array.new(8) { Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN) },
          [nil, Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KNIGHT), nil, nil, nil, nil, nil, nil],
          Array.new(8),
          Array.new(8),
          Array.new(8),
          Array.new(8) { Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN) },
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KING),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::QUEEN),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK)
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
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK),
            nil,
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::QUEEN),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KING),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KNIGHT),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::ROOK)
          ],
          Array.new(8) { Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN) },
          Array.new(8),
          Array.new(8),
          Array.new(8),
          Array.new(8),
          Array.new(8) { Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN) },
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KING),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::QUEEN),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::BISHOP),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::ROOK)
          ],
        ]
      end

      it "black has a score advantage" do
        expect(subject.score).to eq(-3)
      end
    end
  end
end