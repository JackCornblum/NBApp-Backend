class User < ActiveRecord::Base
    has_many :fav_teams
    has_many :fav_players
    has_many :user_teams
    has_many :teams, through: :fav_teams
    has_many :players, through: :fav_players
    has_many :my_teams, through: :user_teams

    def self.all_teams
        user_teams_arr = []
        users = User.all
        user_teams = users.map do |user|
            if user.user_teams.exists?
                user.user_teams
            else
                puts "no user team"
            end
        end
        user_teams.each do |v|
            if v.nil?
                puts "nil"
            else
                user_teams_arr.push(v)
            end
        end
       
        team_players = user_teams_arr.map do |team|
            team.players
        end
        
    end

end