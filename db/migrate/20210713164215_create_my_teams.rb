class CreateMyTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :my_teams do |t|
      t.integer :player_id
      t.integer :user_team_id
    end
  end
end
