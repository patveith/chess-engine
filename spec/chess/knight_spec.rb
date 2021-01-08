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
  end
end
