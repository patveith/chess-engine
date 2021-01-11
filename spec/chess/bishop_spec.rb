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

    let(:available_moves) do
      [
        {
          :file => "b",
          :rank => 2
        },
        {
          :file => "c",
          :rank => 3
        },
        {
          :file => "d",
          :rank => 4
        },
        {
          :file => "e",
          :rank => 5
        },
        {
          :file => "f",
          :rank => 6
        },
        {
          :file => "g",
          :rank => 7
        },
        {
          :file => "h",
          :rank => 8
        }
      ]
    end

    it "returns 7 possible moves" do
      expect(subject.available_moves).to match_array(available_moves)
    end
  end
end
