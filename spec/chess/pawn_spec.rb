require "spec_helper"

RSpec.describe Chess::Pawn do
  describe "#available_moves" do
    let(:board) { Chess::Board.new }

    context "when a white pawn has not yet moved" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::PAWN,
          :file => "a",
          :rank => 2
        )
      end

      let(:available_moves) do
        [
          {
            :file => "a",
            :rank => 3
          },
          {
            :file => "a",
            :rank => 4
          }
        ]
      end
      it "returns two possible moves" do
        expect(subject.available_moves(board)).to match_array(available_moves)
      end
    end

    context "when a white pawn has moved" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::PAWN,
          :file => "a",
          :rank => 2
        )
      end

      let(:available_moves) do
        [
          {
            :file => "a",
            :rank => 4
          }
        ]
      end

      it "returns one move" do
        subject.move_to(:file => "a", :rank => 3)
        expect(subject.available_moves(board)).to match_array(available_moves)
      end
    end

    context "when a black pawn has not yet moved" do
      subject do
        described_class.new(
          :team => described_class::Team::BLACK,
          :type => described_class::Type::PAWN,
          :file => "a",
          :rank => 7
        )
      end

      let(:available_moves) do
        [
          {
            :file => "a",
            :rank => 6
          },
          {
            :file => "a",
            :rank => 5
          }
        ]
      end

      it "returns two possible moves" do
        expect(subject.available_moves(board)).to match_array(available_moves)
      end
    end

    context "when a black pawn has moved" do
      subject do
        described_class.new(
          :team => described_class::Team::BLACK,
          :type => described_class::Type::PAWN,
          :file => "a",
          :rank => 7
        )
      end

      let(:available_moves) do
        [
          {
            :file => "a",
            :rank => 5
          }
        ]
      end

      it "returns one move" do
        subject.move_to(:file => "a", :rank => 6)
        expect(subject.available_moves(board)).to match_array(available_moves)
      end
    end

    context "when a pawn is blocked by another piece direcly in front of it" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::PAWN,
          :file => "e",
          :rank => 4
        )
      end

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
            nil,
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "f", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "g", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "h", :rank => 2)
          ],
          Array.new(8),
          [nil, nil, nil, nil, subject, nil, nil, nil],
          [nil, nil, nil, nil, Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "e", :rank => 5), nil, nil, nil],
          Array.new(8),
          Array.new(8),
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "a", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "b", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "c", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "d", :rank => 7),
            nil,
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
      let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

      it "has no available moves" do
        expect(subject.available_moves(board)).to eq([])
      end
    end

    context "when a pawn is blocked by another piece two squares in front of it" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::PAWN,
          :file => "e",
          :rank => 4
        )
      end

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
            nil,
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "f", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "g", :rank => 2),
            Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::PAWN, :file => "h", :rank => 2)
          ],
          Array.new(8),
          [nil, nil, nil, nil, subject, nil, nil, nil],
          Array.new(8),
          [nil, nil, nil, nil, Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "e", :rank => 6), nil, nil, nil],
          Array.new(8),
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "a", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "b", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "c", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "d", :rank => 7),
            nil,
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
      let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

      let(:available_moves) do
        [
          {
            :file => "e",
            :rank => 5
          }
        ]
      end

      it "has one available move" do
        expect(subject.available_moves(board)).to match_array(available_moves)
      end
    end

    context "when a pawn is threatening a piece" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::PAWN,
          :file => "e",
          :rank => 4
        )
      end

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
          [nil, nil, nil, Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "d", :rank => 5), nil, nil, nil, nil],
          Array.new(8),
          Array.new(8),
          [
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "a", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "b", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "c", :rank => 7),
            Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::PAWN, :file => "d", :rank => 7),
            nil,
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

      let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

      let(:available_moves) do
        [
          {
            :file => "e",
            :rank => 5
          },
          {
            :file => "d",
            :rank => 5
          },
        ]
      end

      it "has 2 available moves" do
        subject.move_to(:file => "e", :rank => 3)
        subject.move_to(:file => "e", :rank => 4)
        expect(subject.available_moves(board)).to match_array(available_moves)
      end
    end
  end
end
