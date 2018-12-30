require_relative 'answer'
require 'rspec'

describe "December 5th Challenge" do
  describe "#find_password" do
    let(:door_id) { "abc" }
    subject { find_password(door_id) }
    it { is_expected.to eq '18f47a30' }

    context "when door_id is ugkcyxxp" do
      let(:door_id) { "ugkcyxxp" }
      it { is_expected.to eq "d4cd2ee1" }
    end
  end

  describe "#find_ordered_password" do
    let(:door_id) { "abc" }
    subject { find_ordered_password(door_id) }
    it { is_expected.to eq '05ace8e3' }

    context "when door_id is ugkcyxxp" do
      let(:door_id) { "ugkcyxxp" }
      it { is_expected.to eq "f2c730e5" }
    end
  end
end
