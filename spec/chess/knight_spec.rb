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

      let(:available_moves) do
        [
          ["c", 2],
          ["b", 3],
          ["b", 5],
          ["c", 6],
          ["e", 6],
          ["f", 5],
          ["f", 3],
          ["e", 2]
        ]
      end

      it "returns 8 moves" do
        expect(subject.available_moves).to match_array(available_moves)
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

        let(:available_moves) do
          [
            ["b", 1],
            ["c", 2],
            ["c", 4],
            ["b", 5]
          ]
        end

        it "does not return moves below file a" do
          expect(subject.available_moves).to match_array(available_moves)
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

        let(:available_moves) do
          [
            ["a", 1],
            ["a", 5],
            ["c", 1],
            ["c", 5],
            ["d", 2],
            ["d", 4]
          ]
        end

        it "does not return moves below file a" do
          expect(subject.available_moves).to match_array(available_moves)
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

        let(:available_moves) do
          [
            ["h", 1],
            ["f", 1],
            ["e", 2],
            ["e", 4],
            ["f", 5],
            ["h", 5]
          ]
        end

        it "does not return moves above file h" do
          expect(subject.available_moves).to match_array(available_moves)
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

        let(:available_moves) do
          [
            ["g", 1],
            ["f", 2],
            ["f", 4],
            ["g", 5]
          ]
        end

        it "does not return moves above file h" do
          expect(subject.available_moves).to match_array(available_moves)
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

        let(:available_moves) do
          [
            ["g", 3],
            ["f", 2]
          ]
        end

        it "does not return moves below rank 1" do
          expect(subject.available_moves).to match_array(available_moves)
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

        let(:available_moves) do
          [
            ["h", 1],
            ["f", 1],
            ["e", 2],
            ["e", 4],
            ["f", 5],
            ["h", 5]
          ]
        end

        it "does not return moves below rank 1" do
          expect(subject.available_moves).to match_array(available_moves)
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

        let(:available_moves) do
          [
            ["f", 8],
            ["f", 6],
            ["g", 5]
          ]
        end

        it "does not return moves above rank 8" do
          expect(subject.available_moves).to match_array(available_moves)
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

        let(:available_moves) do
          [
            ["f", 7],
            ["g", 6]
          ]
        end

        it "does not return moves above rank 8" do
          expect(subject.available_moves).to match_array(available_moves)
        end
      end
    end
  end
end
