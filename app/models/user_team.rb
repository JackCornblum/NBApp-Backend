class UserTeam < ActiveRecord::Base
    belongs_to :user
    has_many :my_teams
    has_many :players, through: :my_teams
end