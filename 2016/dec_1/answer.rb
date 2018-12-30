
# R => North, L => South
def get_distance(path_string, visit_dup_locations = true)
  directions = %w(North East South West)
  current_facing_index = 0
  locations_visited = []
  current_post = [0, 0]
  path_directions = path_string.split(', ')
  location_found = false
  path_directions.each do |p|
    current_facing_index = if p[0] == 'R'
      current_facing_index == directions.length - 1 ? 0 : current_facing_index + 1
    else
      current_facing_index == 0 ? directions.length - 1 : current_facing_index - 1
    end
    dis = p[1..-1].to_i
    dis.times do
      if current_facing_index == 1 # East
        current_post[0] += 1
      elsif current_facing_index == 3 # West
        current_post[0] -= 1
      elsif current_facing_index == 0 # North
        current_post[1] += 1
      elsif current_facing_index == 2 # South
        current_post[1] -= 1
      end
      location_found = locations_visited.include?(current_post) && !visit_dup_locations
      break if location_found
      locations_visited << current_post.dup
    end
    break if location_found
  end
  current_post[0].abs + current_post[1].abs
end
