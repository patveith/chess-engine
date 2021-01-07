require "spec_helper"

RSpec.describe Chess::Board do
  describe "#new" do
    it "prints" do
      expect{ described_class.new }.to output("would you like to play a game?\n").to_stdout
    end
  end
end