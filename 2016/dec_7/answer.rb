def tls_supported?(input)
  nets = input.split("[").map { |s| s.split("]") }.flatten
  found_abba = false
  nets.each_with_index do |str, indx|
    if indx % 2 == 0 && abba?(str)
      found_abba = true
      next
    end
    return false if indx % 2 != 0 && abba?(str)
  end
  found_abba
end

def abba?(input)
  b = 3
  while b < input.length
    beg = input.slice((b-3)..(b-2))
    if beg == input.slice((b-1)..b).reverse && beg[0] != beg[1]
      return true
    end
    b += 1
  end
  false
end

def count_tls_supported(file)
  count = 0
  file.each_line do |line|
    count += 1 if tls_supported?(line)
  end
  count
end

def ssl_supported?(input)
  nets = input.split("[").map { |s| s.split("]") }.flatten
  found_aba_outside = []
  nets.each_with_index do |str, idx|
    if idx % 2 == 0
      found_aba_outside << aba?(str) unless aba?(str).empty?
    end
  end
  nets.each_with_index do |str, idx|
    if idx % 2 != 0
      found_aba_outside.flatten.each do |aba|
        bab = "#{aba[1]}#{aba[0]}#{aba[1]}"
        return true if str.include?(bab)
      end
    end
  end
  false
end

def count_ssl_supported(file)
  count = 0
  file.each_line do |line|
    count += 1 if ssl_supported?(line)
  end
  count
end


def aba?(input)
  b = 2
  all = []
  while b < input.length
    beg = input.slice((b-2)..(b-1))
    if beg == input.slice((b-1)..b).reverse
      all << input.slice((b-2)..b)
    end
    b += 1
  end
  all
end
