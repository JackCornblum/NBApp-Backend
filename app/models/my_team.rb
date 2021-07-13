class MyTeam < ActiveRecord::Base
    belongs_to :player
    belongs_to :user_team
end