require "spec_helper"

RSpec.describe Chess::Board do
  describe "#score" do
    subject { described_class.new }

    context "when given a team" do
      context "when the team is white" do
        it "returns whites piece score" do
          expect(subject.score(:team => described_class::WHITE)).to eq(0)
        end
      end

      context "when the team is black" do
        it "returns blacks piece score" do
          expect(subject.score(:team => described_class::BLACK)).to eq(0)
        end
      end
    end
  end
end