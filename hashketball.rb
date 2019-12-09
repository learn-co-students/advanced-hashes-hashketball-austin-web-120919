require "pry"# Write your code here!
def game_hash
h_a_teams = {

                :home =>{:team_name =>"Brooklyn Nets",
                         :colors =>['Black','White'],
                         :players => [

      {:player_name =>"Alan Anderson",
        :number =>0,
        :shoe =>16,
        :points =>22,
        :rebounds =>12,
        :assists =>12,
        :steals =>3,
        :blocks =>1,
        :slam_dunks =>1},

        {:player_name =>"Reggie Evans",
        :number =>30,
        :shoe =>14,
        :points =>12,
        :rebounds =>12,
        :assists =>12,
        :steals =>12,
        :blocks =>12,
        :slam_dunks =>7},

        {:player_name =>"Brook Lopez",
          :number =>11,
          :shoe =>17,
          :points =>17,
          :rebounds =>19,
          :assists =>10,
          :steals =>3,
          :blocks =>1,
          :slam_dunks =>15},

          {:player_name =>"Mason Plumlee",
            :number =>1,
            :shoe =>19,
            :points =>26,
            :rebounds =>11,
            :assists =>6,
            :steals =>3,
            :blocks =>8,
            :slam_dunks =>5},

            {:player_name =>"Jason Terry",
              :number =>31,
              :shoe =>15,
              :points =>19,
              :rebounds =>2,
              :assists =>2,
              :steals =>4,
              :blocks =>11,
              :slam_dunks =>1}
              ]},




              :away =>{:team_name =>"Charlotte Hornets",
                       :colors =>['Turquoise','Purple'],
                       :players =>[{

      :player_name =>"Jeff Adrien",
      :number =>4,
      :shoe =>18,
      :points =>10,
      :rebounds =>1,
      :assists =>1,
      :steals =>2,
      :blocks =>7,
      :slam_dunks =>2},

      {:player_name =>"Bismack Biyombo",
        :number =>0,
        :shoe =>16,
        :points =>12,
        :rebounds =>4,
        :assists =>7,
        :steals =>22,
        :blocks =>15,
        :slam_dunks =>10},

        {:player_name =>"DeSagna Diop",
          :number =>2,
          :shoe =>14,
          :points =>24,
          :rebounds =>12,
          :assists =>12,
          :steals =>4,
          :blocks =>5,
          :slam_dunks =>5},

          {:player_name =>"Ben Gordon",
            :number =>8,
            :shoe =>15,
            :points =>33,
            :rebounds =>3,
            :assists =>2,
            :steals =>1,
            :blocks =>1,
            :slam_dunks =>0},

            {:player_name =>"Kemba Walker",
              :number =>33,
              :shoe =>15,
              :points =>6,
              :rebounds =>12,
              :assists =>12,
              :steals =>7,
              :blocks =>5,
              :slam_dunks =>12}
              ]
            }
          }

end



#knows the number of points scored by each player
#this method gets called with one player name argument
def num_points_scored(player_name)
  game_hash.each do |h_a,team|
    team.each do |el,el_2|
      if el == :players
        el_2.each do |player|
          if player[:player_name] == player_name
            return player[:points]
          end
        end
      end
    end
  end
end
# same as above except return :shoe
def shoe_size(player_name)
  game_hash.each do |h_a,team|
    team.each do |el,el_2|
      if el == :players
        el_2.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |h_a,team|
    team.each do |el,el_2|
        # binding.pry
        if el_2 == team_name
          return team[:colors]
        end
    end
  end
end

def team_names
  array = []
  game_hash.each do |h_a,team|
    team.each do |el,el_2|
      if el == :team_name
        array << el_2
      end
    end
  end
  array
end

def player_numbers(team_name)
  jersey_numbers = Array.new
  game_hash.each do |h_a,team|
    if team[:team_name] == team_name
      team.each do |el,el_2|
        if el == :players
          el_2.each do |player|
            player.each do|st,value|
              if st == :number
                jersey_numbers << value
              end
            end
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(players_name)
  player_stats = Hash.new
  game_hash.each do |h_a,team|
    team.each do |el,el_2|
      if el == :players
        el_2.each do |player|
          if player[:player_name] == players_name
            player_stats = player.delete_if {|key, value|
              key == :player_name  }
          end
        end
      end
    end
  end
  player_stats
end


def big_shoe_rebounds
  sh_size = {}
  game_hash.each do |h_a,team|
    team.each do |el,el_2|
      if el == :players
        el_2.each do |player|
          player.each do |st,value|
            if st == :shoe
              sh_size[player[:player_name]]=value
              # binding.pry
            end
          end
        end
      end
    end
  end
  largest_shoe = sh_size.max_by{|k,v| v}
  game_hash.each do |h_a,team|
    team.each do |el,el_2|
      if el == :players
        el_2.each do |player|
          if player[:player_name] == largest_shoe[0]
            player.each do |st,re|
              if st == :rebounds
                return re
              end
            end
          end
        end
      end
    end
  end
end
