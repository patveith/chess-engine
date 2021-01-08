require "spec_helper"

RSpec.describe Chess::Bishop do
  describe "#available_moves" do
    subject do
      described_class.new(
        :team => described_class::Team::WHITE,
        :type => described_class::Type::BISHOP,
        :file => "a",
        :rank => 1
      )
    end

    let(:available_moves) {
      [
        ["b", 2],
        ["c", 3],
        ["d", 4],
        ["e", 5],
        ["f", 6],
        ["g", 7],
        ["h", 8]
      ]
    }

    it "returns 7 possible moves" do
      expect(subject.available_moves).to match_array(available_moves)
    end
  end
end
