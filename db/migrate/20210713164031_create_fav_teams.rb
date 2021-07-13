class CreateFavTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :fav_teams do |t|
      t.integer :team_id
      t.integer :user_id
    end
  end
end
