require "spec_helper"

RSpec.describe Chess::Rook do
  describe "#available_moves" do
    subject do
      described_class.new(
        :team => described_class::Team::WHITE,
        :type => described_class::Type::ROOK,
        :file => "a",
        :rank => 1
      )
    end

    let(:available_moves) {
      [
        ["a", 2],
        ["a", 3],
        ["a", 4],
        ["a", 5],
        ["a", 6],
        ["a", 7],
        ["a", 8],
        ["b", 1],
        ["c", 1],
        ["d", 1],
        ["e", 1],
        ["f", 1],
        ["g", 1],
        ["h", 1],
      ]
    }

    it "returns 14 possible moves" do
      expect(subject.available_moves).to match_array(available_moves)
    end
  end
end
