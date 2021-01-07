require "spec_helper"

RSpec.describe Chess::Piece do
  describe "#value" do
    context "when asked for a white pawns value" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::PAWN
        )
      end

      it "returns its numerical value" do
        expect(subject.value).to eq(1)
      end
    end

    context "when asked for a black pawns value" do
      subject do
        described_class.new(
          :team => described_class::Team::BLACK,
          :type => described_class::Type::PAWN
        )
      end

      it "returns its numerical value" do
        expect(subject.value).to eq(-1)
      end
    end

    context "when asked for a unincluded types value" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => "Dog"
        )
      end

      it "raise an error" do
        expect{ subject.value }.to raise_error
      end
    end
  end
end
