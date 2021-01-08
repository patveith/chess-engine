require "spec_helper"

RSpec.describe Chess::Piece do
  describe "#==" do
    subject do
      described_class.new(
        :team => described_class::Team::WHITE,
        :type => described_class::Type::PAWN,
        :file => "a",
        :rank => 2
      )
    end

    context "when team, type, rank, and file are equal" do
      let(:other_object) do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::PAWN,
          :file => "a",
          :rank => 2
        )
      end

      it "it returns true" do
        expect(subject == other_object).to eq(true)
      end
    end

    context "when team and type are not equal" do
      let(:other_object) do
        described_class.new(
          :team => described_class::Team::BLACK,
          :type => described_class::Type::PAWN,
          :file => "a",
          :rank => 7
        )
      end

      it "it returns false" do
        expect(subject == other_object).to eq(false)
      end
    end
  end

  describe "#value" do
    context "when asked for a white pawns value" do
      subject do
        described_class.new(
          :team => described_class::Team::WHITE,
          :type => described_class::Type::PAWN,
          :file => "a",
          :rank => 2
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
          :type => described_class::Type::PAWN,
          :file => "a",
          :rank => 7
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
          :type => "Dog",
          :file => "a",
          :rank => 2
        )
      end

      it "raise an error" do
        expect{ subject.value }.to raise_error
      end
    end
  end
end
