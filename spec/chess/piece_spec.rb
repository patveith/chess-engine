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
        expect { subject.value }.to raise_error
      end
    end
  end

  describe "#move_to" do
    subject do
      described_class.new(
        :team => described_class::Team::WHITE,
        :type => described_class::Type::PAWN,
        :file => "a",
        :rank => 2
      )
    end

    context "when a piece is unmoved" do
      it "updates moved" do
        expect { subject.move_to(:file => "a", :rank => 3) }.to change { subject.moved }.from(false).to(true)
      end
    end

    context "when a piece has already moved" do
      before { subject.move_to(:file => "a", :rank => 3) }

      it "does not update moved" do
        expect(subject.moved).to eq(true)
        expect { subject.move_to(:file => "a", :rank => 4) }.not_to change { subject.moved }
      end
    end

    it "updates rank" do
      expect { subject.move_to(:file => "b", :rank => 3) }.to change { subject.rank }.from(2).to(3)
    end

    it "updates file" do
      expect { subject.move_to(:file => "b", :rank => 3) }.to change { subject.file }.from("a").to("b")
    end
  end

  describe "#file_shift" do
    subject do
      described_class.new(
        :team => described_class::Team::WHITE,
        :type => described_class::Type::PAWN,
        :file => "b",
        :rank => 2
      )
    end

    context "when shifting positively" do
      it "returns the next letter file alphabetically" do
        expect(subject.file_shift(1)).to eq("c")
      end
    end

    context "when shifting negatively" do
      it "returns the next letter file alphabetically" do
        expect(subject.file_shift(-1)).to eq("a")
      end
    end

    context "when shifting off board" do
      it "returns a square not on the board" do
        expect(Chess::Board.on_board?(subject.file_shift(-2), subject.rank)).to eq(false)
      end
    end
  end
end
