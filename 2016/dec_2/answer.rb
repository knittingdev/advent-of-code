

KEYPAD = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

FANCY_KEYBAD = [
  [nil, nil, 1, nil, nil],
  [nil, 2, 3, 4, nil],
  [5, 6, 7, 8, 9],
  [nil, 'A', 'B', 'C', nil],
  [nil, nil, 'D', nil, nil]
]
def get_next_key(line, curr_loc, use_fancy = false)
  keypad = use_fancy ? FANCY_KEYBAD : KEYPAD
  row = keypad.index { |r| r.include?(curr_loc) }
  col = keypad[row].index(curr_loc)
  puts "CURR_ROW #{row} CURR_COL #{col}"
  line.chars.each do |c|
    if c == "U" && row > 0 && !keypad[row - 1][col].nil?
      row -= 1
    elsif c == "R" && col < (keypad[row].length - 1) && !keypad[row][col + 1].nil?
      col += 1
    elsif c == "L" && col > 0 && !keypad[row][col - 1].nil?
     col -= 1
    elsif c == "D" && row < (keypad.length - 1) && !keypad[row + 1][col].nil?
      row += 1
    end
  end
  keypad[row][col]
end

def get_key_code(code_string, use_fancy = false)
  last_loc = 5
  code_string.split("\n").map do |l|
    last_loc = get_next_key(l, last_loc, use_fancy)
  end.join
end
