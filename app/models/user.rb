class User < ActiveRecord::Base
    has_many :fav_teams
    has_many :fav_players
    has_many :user_teams
    has_many :teams, through: :fav_teams
    has_many :players, through: :fav_players
    has_many :my_teams, through: :user_teams
end