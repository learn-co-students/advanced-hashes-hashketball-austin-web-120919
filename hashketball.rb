require 'pry'
def game_hash
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: [
        {player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1},
      {player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7},
      {player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15},
      {player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5},
      {player_name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1}
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players: [
       {player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2},
      {player_name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10},
      {player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5},
      {player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0},
      {player_name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12}
      ]
    }
  }
  return game
end

def num_points_scored(name_of_player)
##  player_database = get_array_of_player_hashes("all")
  #index_counter = 0
  #while index_counter < player_database.length do
#  return  player_database[index_counter][:points] if player_database[index_counter][:player_name] == name_of_player
#    index_counter += 1
#  end
  ##player_database.each do |memo|
    ##return memo[:points] if memo[:player_name] == name_of_player
  ##end
  search_player_by_value(name_of_player, :player_name, :points, "all")

end

def shoe_size(name_of_player)
  search_player_by_value(name_of_player, :player_name, :shoe, "all")
end

def get_array_of_player_hashes(choice)
  home_team_array = game_hash[:home][:players].map{|memo| memo}
  away_team_array = game_hash[:away][:players].map{|memo| memo}
  all_players = home_team_array + away_team_array
  if choice == "home" ||  choice == game_hash[:home][:team_name]
    return home_team_array
  elsif choice == "away" || choice == game_hash[:away][:team_name]
    return away_team_array
  elsif choice == "all"
    return all_players
  end
end


def search_player_by_value(player_value, key_to_compare, key_to_return, hash_choice = "all")
  get_array_of_player_hashes(hash_choice).each do |memo|
    return memo[key_to_return] if memo[key_to_compare] == player_value
  end

end

def team_colors(name_of_team)
  first_step_hash.each do |memo, (key, value)|
    return memo[:colors] if memo[:team_name] == name_of_team
  end
end

def team_names
  team_array = [game_hash[:home][:team_name],game_hash[:away][:team_name]]
  return team_array
end

def player_numbers(name_of_team)
  jersey_array = get_array_of_player_hashes(name_of_team).map do |memo|
    memo[:number]
  end
  return jersey_array
end

def first_step_hash
  first_hashes = []
  game_hash.each() do |(key, value)|
      first_hashes << value
  end
  return first_hashes
end

def player_stats(name_of_player)
  selected_player = {}
get_array_of_player_hashes("all").each do |memo|
    selected_player = memo if memo[:player_name] == name_of_player
  end
  selected_player.delete(:player_name)
  return selected_player
end

def sort_player_by_stat(key_to_compare)
  get_array_of_player_hashes("all").sort_by do |memo|
    memo[key_to_compare]
  end
end

def big_shoe_rebounds
  return sort_player_by_stat(:shoe)[-1][:rebounds]
end

def most_points_scored
  return sort_player_by_stat(:points)[-1][:player_name]
end

def winning_team
  home_total = 0
  get_array_of_player_hashes("home").each do |memo|
  home_total += memo[:points]
end
  away_total = 0
  get_array_of_player_hashes("away").each do |memo|
    away_total += memo[:points]
  end
  if home_total > away_total
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = nil
  get_array_of_player_hashes("all").each do |memo|
    longest_name = memo[:player_name] if !longest_name
    if longest_name.length < memo[:player_name].length
      longest_name = memo[:player_name]
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  player_with_longest_name == sort_player_by_stat(:steals)[-1][:player_name]
end
