require_relative 'answer'
require 'rspec'

describe 'December 1st Answer' do
  let(:visit_dup_locations) { true }

  subject { get_distance(path_string, visit_dup_locations) }

  context 'R2 L3' do
    let(:path_string) { 'R2, L3' }

    it { is_expected.to eq 5 }
  end

  context 'R2 R2 R2' do
    let(:path_string) { 'R2, R2, R2' }

    it { is_expected.to eq 2 }
  end

  context 'R5, L5, R5, R3' do
    let(:path_string) { 'R5, L5, R5, R3' }

    it { is_expected.to eq 12 }
  end

  context 'First 10 of Question' do
    let(:path_string) { "L1, R3, R1, L5, L2, L5, R4, L2, R2, R2" }
    
    it { is_expected.to eq 11 }
  end

  context 'When path string contains numbers larger than 9' do
    let(:path_string) { "R253" }

    it { is_expected.to eq 253 }
  end

  context 'when we visit a location twice' do
    let(:path_string) { "R8, R4, R4, R8" }

    it { is_expected.to eq 8 }

    context "when not visiting duplicate locations" do
      let(:visit_dup_locations) { false }
      it { is_expected.to eq 4 }
    end
  end

  context 'THE TEST for PROB 1' do
    let(:path_string) do
      "L1, R3, R1, L5, L2, L5, R4, L2, R2, R2, "\
        "L2, R1, L5, R3, L4, L1, L2, R3, R5, L2, "\
        "R5, L1, R2, L5, R4, R2, R2, L1, L1, R1, "\
        "L3, L1, R1, L3, R5, R3, R3, L4, R4, L2, "\
        "L4, R1, R1, L193, R2, L1, R54, R1, L1, R71, "\
        "L4, R3, R191, R3, R2, L4, R3, R2, L2, L4, "\
        "L5, R4, R1, L2, L2, L3, L2, L1, R4, R1, "\
        "R5, R3, L5, R3, R4, L2, R3, L1, L3, L3, "\
        "L5, L1, L3, L3, L1, R3, L3, L2, R1, L3, "\
        "L1, R5, R4, R3, R2, R3, L1, L2, R4, L3, "\
        "R1, L1, L1, R5, R2, R4, R5, L1, L1, R1, "\
        "L2, L4, R3, L1, L3, R5, R4, R3, R3, L2, "\
        "R2, L1, R4, R2, L3, L4, L2, R2, R2, L4, "\
        "R3, R5, L2, R2, R4, R5, L2, L3, L2, R5, "\
        "L4, L2, R3, L5, R2, L1, R1, R3, R3, L5, "\
        "L2, L2, R5"
    end

    it { is_expected.to eq 278 }

    context "THE TEST for PROB 2" do
      let(:visit_dup_locations) { false }
      it { is_expected.to eq 161 }
    end
  end
end
