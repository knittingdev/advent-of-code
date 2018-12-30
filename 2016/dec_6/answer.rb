def clean_message(file, val_selector = :>)
  columns = {}
  file.each_line do |line|
    line.chomp.chars.each_with_index do |c, idx|
      columns[idx] ||= {}
      columns[idx][c] ||= 0
      columns[idx][c] += 1
    end
  end
  answer = []
  columns.values.each do |value|
    highest = ""
    count = nil
    value.each do |k, v|
      if count.nil? || v.send(val_selector, count)
        count = v
        highest = k
      end
    end
    answer << highest
  end
  answer.join
end
