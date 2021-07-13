class Player < ActiveRecord::Base
    has_many :fav_players
    has_many :users, through: :fav_players
    has_many :my_teams
    has_many :user_teams, through: :my_teams
    belongs_to :team
end