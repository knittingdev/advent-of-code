def is_triangle?(numbers)
  return false if numbers.count > 3
  numbers.permutation(2).all? do |p|
    other_array = numbers.dup
    p.each do |n|
      other_array.delete_at(other_array.index(n))
    end
    p.inject(:+) > other_array.first
  end
end

def triangle_count(file)
  count = 0
  file.each_line do |line|
    split = line.strip.split(/\W+/).map { |n| n.strip.to_i }
    if is_triangle?(split)
      count += 1
    end
  end
  count
end

def triangle_count_by_column(file)
  column_1 = []
  column_2 = []
  column_3 = []
  count = 0
  file.each_line do |line|
    split = line.strip.split(/\W+/).map { |n| n.strip.to_i }
    column_1 << split[0]
    column_2 << split[1]
    column_3 << split[2]
    if column_1.length == 3
      count += 1 if is_triangle?(column_1)
      column_1 = []
    end
    if column_2.length == 3
      count += 1 if is_triangle?(column_2)
      column_2 = []
    end
    if column_3.length == 3
      count += 1 if is_triangle?(column_3)
      column_3 = []
    end
  end
  count
end


