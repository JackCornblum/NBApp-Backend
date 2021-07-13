class Team < ActiveRecord::Base
    has_many :fav_teams
    has_many :users, through: :fav_teams
    has_many :players
end