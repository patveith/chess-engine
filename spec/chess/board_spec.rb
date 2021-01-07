require "spec_helper"

RSpec.describe Chess::Board do
  describe "#new" do
    subject { described_class.new }

    context "when creating a new board" do
      let(:board) do
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
        expect(subject.board).to eq(board)
      end
    end
  end

  describe "#score" do
    subject { described_class.new }

    context "when black has taken a knight" do
      it "black has a score advantage" do
        expect(subject.score).to eq(3)
      end

      it "white has a score disadvantage" do
        expect(subject.score).to eq(-3)
      end
    end
  end
end