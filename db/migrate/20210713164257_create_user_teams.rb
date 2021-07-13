class CreateUserTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_teams do |t|
      t.string :team_name
      t.integer :user_id
    end
  end
end
