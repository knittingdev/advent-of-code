require_relative 'answer'
require 'rspec'

describe 'December 2nd Answer' do
  describe "#get_next_key" do
    let(:use_fancy) { false }
    subject { get_next_key(line, loc, use_fancy) }
    context "when line is ULL & start at 5" do
      let(:line) { "ULL" }
      let(:loc) { 5 }
      it { is_expected.to eq 1 }

      context "when use fancy" do
        let(:use_fancy) { true }
        it { is_expected.to eq 5 }
      end
    end

    context "when line is RRDDD & start at 1" do
      let(:line) { "RRDDD" }
      let(:loc) { 1 }
      it { is_expected.to eq 9 }
 
      context "when use fancy" do
        let(:loc) { 5 }
        let(:use_fancy) { true }
        it { is_expected.to eq "D" }
      end
   end

    context "when line is LURDL & start at 9" do
      let(:line) { "LURDL" }
      let(:loc) { 9 }
      it { is_expected.to eq 8 }
 
      context "when use fancy" do
        let(:use_fancy) { true }
        let(:loc) { "D" }
        it { is_expected.to eq "B" }
      end
   end

    context "when line is UUUUD & start at 8" do
      let(:line) { "UUUUD" }
      let(:loc) { 8 }
      it { is_expected.to eq 5 }
  
      context "when use fancy" do
        let(:use_fancy) { true }
        let(:loc) { "B" }
        it { is_expected.to eq 3 }
      end
   end
  end

  describe "#get_key_code" do
    let(:code_string) do
      "ULL\n"\
      "RRDDD\n"\
      "LURDL\n"\
      "UUUUD"
    end

    let(:use_fancy) { false }
    subject { get_key_code(code_string, use_fancy) }
    it { is_expected.to eq "1985" } 

    context "use fancy" do
      let(:use_fancy) { true } 
      it { is_expected.to eq "5DB3" }
    end

    context "TEST PROBLEM 1" do
      let(:code_string) do
        "RLRLLLULULULUUDUULULRDDLURURDDLDUUDDLRDDUUUDDRUDLRRDDUDUUDULUDRDULRUDRULRDRUDLDDULRRDLDRLUDDLLDRDDDUDDLUDUDULDRLLDRLULRLURDLULRUUUDRULLUUDLRDLDDUDRRRLDLRUUURRLDDRRRURLLULDUULLDRLRDLLDURDLDDULLDDLDLUURRRURLRURLLRRDURLDUDDLULUUULULLLDRRRRRLULRDUDURURLULRURRRLLUURDURULRRUULDRDLULDLLUDLUDRLUDLRRLDLLDLDUDDLULLDRULRLRULDURRDLDLLUDRLLDRRDLDUDUURUURDUUDDDLDLDDRDLUDLDUUUUDLDRLRURDLURURDLLLUURURDRDLUDLLRUDULLLDLULLULLDLDDRDRRRUDDDUDDDDRULLLLRLDDLLRDRLLLRRLDRRUDRUUURLLLRULRRDURDLDRLDDUUDUUURRLRRUDLDLDDRUDLULLUUDUUUDLUDDRUULLLURUDDDDLRUDDLLLRUR\n"\
          "LDLRLDDDLUDRDRRUDUURLRULLUDDRLURLUULDLLRLLUDLRLRUDLULRLRRLRURLDDDURUDUUURDRLDDLUUUDRUDUDDDLLURLLULRUULLUDRULUDDULDUDUDULLDRUUUULRDUUDLUDURDLLRLLRLUUDUUDRLLLRULUURUDLDRLLDUDLDDRULDULDURRLDDDUDUDDRUDUDRDURLLLLLULDRDDLLUDULLLUDRURLDLDLDULLDDRURRLUDDRLURLULRLDDDUUUURLRDLRURDDURLDLRRLLRLRLUURRLLDDLDRLRDUDDLLDDDURUUDURLRRDUULRRDDRRUULDRLRUDRRLDDRLDRULLDLDURRULDURRRDLRRLRLLLRLDRLLULRRLLLLLDLDDULDLLDLLDUUDDRLURUUUUULRDDLRDLRDRDRDLUDDLDDRULLUDDRLDLLUDRLUURRLUDURURLLRURRURRLRLLRLURURDDDDRRLURDUULLUU\n"\
          "LLRRDURRDLDULRDUDLRDRDRURULDURUDRRURDDDRLDLDRDRDRDRULDUURLULDDUURUULUDULLDUDLLLLDLLLDRLUUULLULDDRRUDDULLLULRDRULDDULDUDRDDLUUURULDLLUDUUUUURUDLLDRDULLRULLDURDRLLDLDRDDURUULUDURRRUULLDUUDDURDURLDLRRLLDURDDLRRRUDLRRRDLDRLUDLUDRDRLDDLLLRLLRURDLRDUUUURRLULDDLDLLLUDRDRLRRDURDDLURDLDDDULLLRRLDDDRULDDDLRRDULUUUDRRULDDLLLURDRRLLLUULDRRRUURRDDLULDRLULDDDLDULDRRRULRULLURLURULLLLRUDRRRDRDRDLDULURLRRRRLRUDDRRRUURUURLLRURURUURRURRDLDLLUDRRRDUDDRDURLLRLRRULD\n"\
          "DULRRDRLRLUDLLURURLLRLRDLLDLLDRDUURLRUUUDLLDUUDDUULDUULLRUDRURLUDRDLRUDDDLULUDLLDRULULLLDRRULDLLUURLRRRLDRDLDRURRRRDLRUUDULLRLLLDLRUDLDUUDRLDLRDRLRDLDDDUDLRUDLDDLLLDRLLRRUUDRDDUUURURRRUUDLRRDDRUDLDDULULDLRRLRDDUDRUURRUULURLURUDRRURRRULDDDDURDLUUULUULULRDLRRRRRURURRLRUULDUUURRDRRDLDUUUULLULLLLUDLUUDUURRDLDLRRRLUUURULDULDLDRLLURDRUULLLLLULLLDRURURRUDRRRRUDUDUDRUDUDRDRULUUDRURDDUUDLDLDUURUDURLRLRRDRDRDLLDUDDULLRDLDDRLLDLRDURDDULLLDLLLULDLUUUDLDRDLURUURDDLRDLLLLLRLURDLLLULLRRLU\n"\
          "DUULULUUDUDLLRLRURULLDLRRLURDLLDUDUDDRURRLUDULULDRRDRLUULUDDLUURURDLDDDRDRUDURLDDLUDUURULRRUUDRLURRLRLDURRRULRLDDDRUDDDDDUDDULLLRRLLDULDRULUDLRRDLLUDRDLDULRLLLUULLRULRLLLLUDDRRDRLULDLDLURDDRUDDLDLDLDRULDLLDDUUDULUULULLURDURRLLUDRULLRDUDRDRURDRDRDURUUDULDDRURUDLLUUDUUDURDLRDRURUDRUURLUUURLRLUDRUDRUURLLUDRLURDDURRUDRDRLRRLDDDRDDLUUUDDLULDUURUDUDLLDRURDURRDULRLURRDLDDRLUDRLDLRLDDUURRULDDLDUDDLRDULLDDDLDUUUUDLRUDUDLDRDLRDDLDLRLLUDDRRLUDLDUUULLDDRLRRDLRRRRUDDLRLLULRLRDURDUDDRRULLDDLDLRRDLLULDURURDDURLRLULULURRUDUDRDLURULDUDLUULDUUURLLRUDLLRDLRUDRLULDUDRRDUUDUUULUUUDDRUD"
      end
      
      it { is_expected.to eq "61529" }

      context "when use fancy" do
        let(:use_fancy) { true }
        it { is_expected.to eq "C2C28" }
      end
    end
  end
end
