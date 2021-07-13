class AddTricodeToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :tricode, :string
    add_column :teams, :conf_name, :string
  end
end
