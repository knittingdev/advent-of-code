require_relative 'answer.rb'
require 'rspec'

describe "DEC 7 Answers" do
  context "#tls_supported?" do
    let(:input_string) { "" }
    subject { tls_supported?(input_string) }

    context "when 'abba[mnop]qrst'" do
      let(:input_string) { "abba[mnop]qrst" }
      it { is_expected.to eq true }
    end

    context "when 'abcd[bddb]xyyx'" do
      let(:input_string) { "abcd[bddb]xyyx" }
      it { is_expected.to eq false }
    end

    context "when 'aaaa[qwer]tyui'" do
      let(:input_string) { "aaaa[qwer]tyui" }
      it { is_expected.to eq false }
    end
    
    context "when 'ioxxoj[asdfgh]zxcvbn'" do
      let(:input_string) { "oxxoj[asdfgh]zxcvbn" }
      it { is_expected.to eq true }
    end
  end

  context "abba?" do
    let(:input) { "" }
    subject { abba?(input) }

    context "when 'xyyx'" do
      let(:input) { "xyyx" }
      it { is_expected.to eq true }
    end

    context "when 'abcd'" do
      let(:input) { "abcd" }
      it { is_expected.to eq false }
    end

    context "when 'ioxxoj'" do
      let(:input) { "ioxxoj" }
      it { is_expected.to eq true }
    end

    context "when 'ijoxxo'" do
      let(:input) { "ijoxxo" }
      it { is_expected.to eq true }
    end

    context "when 'oxxoij'" do
      let(:input) { "oxxoij" }
      it { is_expected.to eq true }
    end

    context "when 'aaaa'" do
      let(:input) { "aaaa" }
      it { is_expected.to eq false }
    end
  end

  context "count_tls_supported" do
    let(:input) do
      File.open(File.expand_path("./dec_7/test_input.txt"))
    end
    subject { count_tls_supported(input) }
    
    it { is_expected.to eq 115 }
  end

  context "count_ssl_supported" do
    let(:input) do
      File.open(File.expand_path("./dec_7/test_input.txt"))
    end
    subject { count_ssl_supported(input) }
    
    it { is_expected.to eq 231 }
  end

  context "ssl_supported?" do
    subject { ssl_supported?(input) }
    context "when 'aba[bab]xyz'" do
      let(:input) { "aba[bab]xyz" }
      it { is_expected.to eq true }
    end

    context "when 'xyx[xyx]xyx'" do
      let(:input) { "xyx[xyx]xyx" }
      it { is_expected.to eq false }
    end
    
    context "when 'aaa[kek]eke'" do
      let(:input) { "aaa[kek]eke" }
      it { is_expected.to eq true }
    end

    context "when 'zazbz[bzb]cdb'" do
      let(:input) { "zazbz[bzb]cdb" }
      it { is_expected.to eq true }
    end
  end
end
