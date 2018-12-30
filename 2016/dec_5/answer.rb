require 'digest'

def find_password(door_id)
  password = []
  index = 0
  while password.length < 8
    hash = Digest::MD5.hexdigest("#{door_id}#{index}")
    if hash.length > 5 && hash.chars.slice(0..4).all? { |c| c == '0' }
      puts "Next Character Found: #{hash[5]}"
      password << hash[5]
    end
    index += 1
  end
  password.join
end

def find_ordered_password(door_id)
  password = Array.new(8)
  ints = ('0'..'9').to_a
  index = 0
  while password.any? { |c| c.nil? }
    hash = Digest::MD5.hexdigest("#{door_id}#{index}")
    if hash.length > 5 &&
        hash.chars.slice(0..4).all? { |c| c == '0' } &&
        hash[5].to_i < 8 &&
        ints.include?(hash[5]) &&
        password[hash[5].to_i].nil?
      puts "Next Character Found: #{hash[6]}"
      password[hash[5].to_i] = hash[6]
    end
    index += 1
  end
  password.join
end
