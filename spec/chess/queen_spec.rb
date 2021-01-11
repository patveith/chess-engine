require "spec_helper"

RSpec.describe Chess::Queen do
  describe "#available_moves" do
    subject do
      described_class.new(
        :team => described_class::Team::WHITE,
        :type => described_class::Type::QUEEN,
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
        },
        {
          :file => "a",
          :rank => 2
        },
        {
          :file => "a",
          :rank => 3
        },
        {
          :file => "a",
          :rank => 4
        },
        {
          :file => "a",
          :rank => 5
        },
        {
          :file => "a",
          :rank => 6
        },
        {
          :file => "a",
          :rank => 7
        },
        {
          :file => "a",
          :rank => 8
        },
        {
          :file => "b",
          :rank => 1
        },
        {
          :file => "c",
          :rank => 1
        },
        {
          :file => "d",
          :rank => 1
        },
        {
          :file => "e",
          :rank => 1
        },
        {
          :file => "f",
          :rank => 1
        },
        {
          :file => "g",
          :rank => 1
        },
        {
          :file => "h",
          :rank => 1
        }
      ]
    end

    it "returns 21 possible moves" do
      expect(subject.available_moves).to match_array(available_moves)
    end
  end
end
