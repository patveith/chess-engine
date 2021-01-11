require "spec_helper"

RSpec.describe Chess::Knight do
  describe "#available_moves" do
    context "when the knight has unrestricted movement" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::KNIGHT,
          :file => "d",
          :rank => 4
        )
      end

      let(:board_matrix) do
        [
          Array.new(8),
          Array.new(8),
          Array.new(8),
          [nil, nil, nil, subject, nil, nil, nil, nil],
          Array.new(8),
          Array.new(8),
          Array.new(8),
          Array.new(8)
        ]
      end
      let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

      let(:available_moves) do
        [
          {
            :file => "c",
            :rank => 2
          },
          {
            :file => "b",
            :rank => 3
          },
          {
            :file => "b",
            :rank => 5
          },
          {
            :file => "c",
            :rank => 6
          },
          {
            :file => "e",
            :rank => 6
          },
          {
            :file => "f",
            :rank => 5
          },
          {
            :file => "f",
            :rank => 3
          },
          {
            :file => "e",
            :rank => 2
          }
        ]
      end

      it "returns 8 moves" do
        expect(subject.available_moves(board)).to match_array(available_moves)
      end
    end

    context "when the board restricts movement" do
      context "when the knight is on the a file" do
        subject do
          described_class.new(
            :team => described_class::Team::WHITE,
            :type => described_class::Type::KNIGHT,
            :file => "a",
            :rank => 3
          )
        end

        let(:board_matrix) do
          [
            Array.new(8),
            Array.new(8),
            [subject, nil, nil, nil, nil, nil, nil, nil],
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8)
          ]
        end

        let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

        let(:available_moves) do
          [
            {
              :file => "b",
              :rank => 1
            },
            {
              :file => "c",
              :rank => 2
            },
            {
              :file => "c",
              :rank => 4
            },
            {
              :file => "b",
              :rank => 5
            }
          ]
        end

        it "does not return moves below file a" do
          expect(subject.available_moves(board)).to match_array(available_moves)
        end
      end

      context "when the knight is on the b file" do
        subject do
          described_class.new(
            :team => described_class::Team::WHITE,
            :type => described_class::Type::KNIGHT,
            :file => "b",
            :rank => 3
          )
        end

        let(:board_matrix) do
          [
            Array.new(8),
            Array.new(8),
            [nil, subject, nil, nil, nil, nil, nil, nil],
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8)
          ]
        end

        let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

        let(:available_moves) do
          [
            {
              :file => "a",
              :rank => 1
            },
            {
              :file => "a",
              :rank => 5
            },
            {
              :file => "c",
              :rank => 1
            },
            {
              :file => "c",
              :rank => 5
            },
            {
              :file => "d",
              :rank => 2
            },
            {
              :file => "d",
              :rank => 4
            }
          ]
        end

        it "does not return moves below file a" do
          expect(subject.available_moves(board)).to match_array(available_moves)
        end
      end

      context "when the knight is on the g file" do
        subject do
          described_class.new(
            :team => described_class::Team::WHITE,
            :type => described_class::Type::KNIGHT,
            :file => "g",
            :rank => 3
          )
        end

        let(:board_matrix) do
          [
            Array.new(8),
            Array.new(8),
            [nil, nil, nil, nil, nil, nil, subject, nil],
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8)
          ]
        end

        let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

        let(:available_moves) do
          [
            {
              :file => "h",
              :rank => 1
            },
            {
              :file => "f",
              :rank => 1
            },
            {
              :file => "e",
              :rank => 2
            },
            {
              :file => "e",
              :rank => 4
            },
            {
              :file => "f",
              :rank => 5
            },
            {
              :file => "h",
              :rank => 5
            }
          ]
        end

        it "does not return moves above file h" do
          expect(subject.available_moves(board)).to match_array(available_moves)
        end
      end

      context "when the knight is on the h file" do
        subject do
          described_class.new(
            :team => described_class::Team::WHITE,
            :type => described_class::Type::KNIGHT,
            :file => "h",
            :rank => 3
          )
        end

        let(:board_matrix) do
          [
            Array.new(8),
            Array.new(8),
            [nil, nil, nil, nil, nil, nil, nil, subject],
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8)
          ]
        end

        let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

        let(:available_moves) do
          [
            {
              :file => "g",
              :rank => 1
            },
            {
              :file => "f",
              :rank => 2
            },
            {
              :file => "f",
              :rank => 4
            },
            {
              :file => "g",
              :rank => 5
            }
          ]
        end

        it "does not return moves above file h" do
          expect(subject.available_moves(board)).to match_array(available_moves)
        end
      end

      context "when the knight is on rank 1" do
        subject do
          described_class.new(
            :team => described_class::Team::WHITE,
            :type => described_class::Type::KNIGHT,
            :file => "h",
            :rank => 1
          )
        end

        let(:board_matrix) do
          [
            [nil, nil, nil, nil, nil, nil, nil, subject],
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8)
          ]
        end

        let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

        let(:available_moves) do
          [
            {
              :file => "g",
              :rank => 3
            },
            {
              :file => "f",
              :rank => 2
            }
          ]
        end

        it "does not return moves below rank 1" do
          expect(subject.available_moves(board)).to match_array(available_moves)
        end
      end

      context "when the knight is on rank 2" do
        subject do
          described_class.new(
            :team => described_class::Team::WHITE,
            :type => described_class::Type::KNIGHT,
            :file => "g",
            :rank => 3
          )
        end

        let(:board_matrix) do
          [
            Array.new(8),
            Array.new(8),
            [nil, nil, nil, nil, nil, nil, subject, nil],
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8)
          ]
        end

        let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

        let(:available_moves) do
          [
            {
              :file => "h",
              :rank => 1
            },
            {
              :file => "f",
              :rank => 1
            },
            {
              :file => "e",
              :rank => 2
            },
            {
              :file => "e",
              :rank => 4
            },
            {
              :file => "f",
              :rank => 5
            },
            {
              :file => "h",
              :rank => 5
            }
          ]
        end

        it "does not return moves below rank 1" do
          expect(subject.available_moves(board)).to match_array(available_moves)
        end
      end

      context "when the knight is on rank 7" do
        subject do
          described_class.new(
            :team => described_class::Team::WHITE,
            :type => described_class::Type::KNIGHT,
            :file => "h",
            :rank => 7
          )
        end

        let(:board_matrix) do
          [
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            [nil, nil, nil, nil, nil, nil, nil, subject],
            Array.new(8)
          ]
        end

        let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

        let(:available_moves) do
          [
            {
              :file => "f",
              :rank => 8
            },
            {
              :file => "f",
              :rank => 6
            },
            {
              :file => "g",
              :rank => 5
            }
          ]
        end

        it "does not return moves above rank 8" do
          expect(subject.available_moves(board)).to match_array(available_moves)
        end
      end

      context "when the knight is on rank 8" do
        subject do
          described_class.new(
            :team => described_class::Team::WHITE,
            :type => described_class::Type::KNIGHT,
            :file => "h",
            :rank => 8
          )
        end

        let(:board_matrix) do
          [
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            Array.new(8),
            [nil, nil, nil, nil, nil, nil, nil, subject]
          ]
        end

        let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

        let(:available_moves) do
          [
            {
              :file => "f",
              :rank => 7
            },
            {
              :file => "g",
              :rank => 6
            }
          ]
        end

        it "does not return moves above rank 8" do
          expect(subject.available_moves(board)).to match_array(available_moves)
        end
      end
    end

    context "when same team pieces restrict movement" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::KNIGHT,
          :file => "d",
          :rank => 4
        )
      end

      let(:board_matrix) do
        [
          Array.new(8),
          [nil, nil, Chess::Piece.new(:team => Chess::Piece::Team::WHITE, :type => Chess::Piece::Type::KING, :file => "c", :rank => 2), nil, nil, nil, nil, nil],
          Array.new(8),
          [nil, nil, nil, subject, nil, nil, nil, nil],
          Array.new(8),
          Array.new(8),
          Array.new(8),
          Array.new(8)
        ]
      end

      let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

      let(:available_moves) do
        [
          {
            :file => "b",
            :rank => 3
          },
          {
            :file => "b",
            :rank => 5
          },
          {
            :file => "c",
            :rank => 6
          },
          {
            :file => "e",
            :rank => 6
          },
          {
            :file => "f",
            :rank => 5
          },
          {
            :file => "f",
            :rank => 3
          },
          {
            :file => "e",
            :rank => 2
          }
        ]
      end

      it "returns 7 moves" do
        expect(subject.available_moves(board)).to match_array(available_moves)
      end
    end

    context "when enemy team pieces occupy an available movement square" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::KNIGHT,
          :file => "d",
          :rank => 4
        )
      end

      let(:board_matrix) do
        [
          Array.new(8),
          [nil, nil, Chess::Piece.new(:team => Chess::Piece::Team::BLACK, :type => Chess::Piece::Type::KNIGHT, :file => "c", :rank => 2), nil, nil, nil, nil, nil],
          Array.new(8),
          [nil, nil, nil, subject, nil, nil, nil, nil],
          Array.new(8),
          Array.new(8),
          Array.new(8),
          Array.new(8)
        ]
      end

      let(:board) { Chess::Board.new(:board_matrix => board_matrix) }

      let(:available_moves) do
        [
          {
            :file => "c",
            :rank => 2
          },
          {
            :file => "b",
            :rank => 3
          },
          {
            :file => "b",
            :rank => 5
          },
          {
            :file => "c",
            :rank => 6
          },
          {
            :file => "e",
            :rank => 6
          },
          {
            :file => "f",
            :rank => 5
          },
          {
            :file => "f",
            :rank => 3
          },
          {
            :file => "e",
            :rank => 2
          }
        ]
      end

      it "returns 8 moves" do
        expect(subject.available_moves(board)).to match_array(available_moves)
      end
    end
  end
end
