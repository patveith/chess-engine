require "spec_helper"

RSpec.describe Chess::Pawn do
  describe "#available_moves" do
    context "when a pawn has not yet moved" do
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
        expect(subject.available_moves).to match_array(available_moves)
      end
    end

    context "when a pawn has moved" do
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
        expect(subject.available_moves).to match_array(available_moves)
      end
    end
  end
end
