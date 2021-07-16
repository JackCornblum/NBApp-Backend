class UserTeam < ActiveRecord::Base
    belongs_to :user
    has_many :my_teams
    has_many :players, through: :my_teams

    def my_team
        team = {"team" => self.players, "name" => self.team_name}
        team
    end

    def self.all_teams
        players =  UserTeam.all.map do |team|
            team.my_teams
        end
        players
    end
end