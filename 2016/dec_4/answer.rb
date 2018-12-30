def sector_id(id, skip_validation = false)
  split_id = id.split("-")
  string = split_id.slice(0..-2).join
  open_bracket = split_id.last.index("[") || 0
  if !skip_validation
    close_bracket = split_id.last.index("]")
    checksum = split_id.last.slice((open_bracket + 1)..(close_bracket - 1)).chars
    counts = {}
    string.chars.uniq.map do |c|
      n = string.count(c)
      counts[n] ||= []
      counts[n] << c
    end
    counts.keys.sort.reverse.each do |k|
      val = counts[k].sort.slice(0..(checksum.length - 1))
      check = checksum.slice!(0..(val.length - 1))
      return nil if check != val
      break if checksum.empty?
    end
  end
  split_id.last.slice(0..(open_bracket - 1)).to_i
end

def sector_sum(file)
  sum = 0
  file.each_line do |line|
    sum += sector_id(line) || 0
  end
  sum
end

def decrypted_sector_name(id)
  rotation = sector_id(id, true)
  split_id = id.split("-").slice(0..-2).map do |substring|
    substring.chars.map do |c|
      alpha = (c..'z').to_a + ('a'..c).to_a.slice(0..-2)
      alpha.rotate(rotation).first
    end.join
  end.join(" ")
end

def find_north_pole(file)
  file.each_line do |line|
    name = decrypted_sector_name(line)
    if name.include?("north") && name.include?("pole")
      return sector_id(line, true)
    end
  end
end






