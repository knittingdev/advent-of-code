require_relative 'answer'
require 'rspec'

describe "December 6th challenge" do
  describe "clean_message" do
    let(:input) do
      File.open(File.expand_path("./dec_6/dirty_test_message_1.txt"))
    end
    let(:val_selector) { :> }
    
    subject { clean_message(input, val_selector) }
    it { is_expected.to eq "easter" }

    context "when file is given input" do
      let(:input) do
        File.open(File.expand_path("./dec_6/given_dirty_message.txt"))
      end

      it { is_expected.to eq "umcvzsmw" }

      context "when val_selector is least" do
        let(:val_selector) { :< }
        it { is_expected.to eq "rwqoacfz" }
      end
    end
  end
end
