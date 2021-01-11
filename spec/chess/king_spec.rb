require "spec_helper"

RSpec.describe Chess::King do
  describe "#available_moves" do
    subject do
      described_class.new(
        :team => described_class::Team::WHITE,
        :type => described_class::Type::KING,
        :file => "a",
        :rank => 1
      )
    end

    let(:available_moves) do
      [
        {
          :file => "a",
          :rank => 2
        },
        {
          :file => "b",
          :rank => 2
        },
        {
          :file => "b",
          :rank => 1
        }
      ]
    end

    it "returns 3 possible moves" do
      expect(subject.available_moves).to match_array(available_moves)
    end
  end
end
