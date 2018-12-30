require_relative 'answer.rb'
require 'rspec'

describe "December 4th" do
  describe "#sector_id" do
    subject { sector_id(id) }

    context "when id is 'aaaaa-bbb-z-y-x-123[abxyz]'" do
      let(:id) { "aaaaa-bbb-z-y-x-123[abxyz]" }

      it { is_expected.to eq 123 }
    end

    context "when id is 'a-b-c-d-e-f-g-h-987[abcde]'" do
      let(:id) { "a-b-c-d-e-f-g-h-987[abcde]" }

      it { is_expected.to eq 987 }
    end

    context "when id is 'not-a-real-room-404[oarel]'" do
      let(:id) { "not-a-real-room-404[oarel]" }

      it { is_expected.to eq 404 }
    end

    context "when id is 'totally-real-room-200[decoy]'" do
      let(:id) { "totally-real-room-200[decoy]" }

      it { is_expected.to eq nil }
    end
  end

  describe "sector_sum" do
    let(:file) do
        File.open(File.expand_path("./dec_4/problem_set.txt"))
    end

    subject { sector_sum(file) }

    it { is_expected.to eq 185371 }
  end

  describe "decrypted_sector_name" do
    subject { decrypted_sector_name(id) }

    context "when id is 'qzmt-zixmtkozy-ivhz-343'" do
      let(:id) { 'qzmt-zixmtkozy-ivhz-343' }
      it { is_expected.to eq 'very encrypted name' }
    end

  end

  describe "find north pole storage" do
    let(:file) do
        File.open(File.expand_path("./dec_4/problem_set.txt"))
    end

    subject { find_north_pole(file) }

    it { is_expected.to eq 984 }
  end
end
