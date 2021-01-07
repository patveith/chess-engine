require "spec_helper"

RSpec.describe Chess::Board do
  describe "#score" do
    subject { described_class.new }

    context "when given a team" do
      context "when the team is white" do
        it "returns whites piece score" do
          expect(subject.score(:team => Chess::Piece::Team::WHITE)).to eq(0)
        end
      end

      context "when the team is black" do
        it "returns blacks piece score" do
          expect(subject.score(:team => Chess::Piece::Team::BLACK)).to eq(0)
        end
      end
    end

    context "when black has taken a knight" do
      it "black has a score advantage" do
        expect(subject.score(:team => Chess::Piece::Team::BLACK)).to eq(3)
      end

      it "white has a score disadvantage" do
        expect(subject.score(:team => Chess::Piece::Team::WHITE)).to eq(-3)
      end
    end
  end
end