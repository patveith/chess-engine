require "spec_helper"

RSpec.describe Chess::Board do
  describe "#score" do
    subject { described_class.new }

    context "when black has taken a knight" do
      it "black has a score advantage" do
        expect(subject.score).to eq(3)
      end

      it "white has a score disadvantage" do
        expect(subject.score).to eq(-3)
      end
    end
  end
end