require_relative 'answer'
require 'rspec'

describe "December 3rd" do
  describe "#is_triangle?" do
    let(:line) { [5, 10, 25] }
    subject { is_triangle?(line) }
    it { is_expected.to eq false }

    context "when line is" do
      let(:line) { [330, 143, 338] }

      it { is_expected.to eq true }
    end

    context "when line is not triangle" do
      let(:line)  { [918, 4, 447] }
      it { is_expected.to eq false }
    end

    context "when line is REALLY not a triangle" do
      let(:line) { [12, 12, 634] }
      it { is_expected.to eq false }
    end
  end

  describe "#triangle_count" do
    let(:input) do
      File.open(File.expand_path("./dec_3/problem_set.txt"))
    end
    subject { triangle_count(input) }
    it { is_expected.to eq 917 }
  end

  describe "#triangle_by_column" do
    let(:input) do
      File.open(File.expand_path("./dec_3/test_columns.txt"))
    end

    subject { triangle_count_by_column(input) }

    it { is_expected.to eq 6 }

    context "TEST" do
      let(:input) do
        File.open(File.expand_path("./dec_3/problem_set.txt"))
      end
      subject { triangle_count_by_column(input) }
      it { is_expected.to eq 1649 }
    end
  end
end
