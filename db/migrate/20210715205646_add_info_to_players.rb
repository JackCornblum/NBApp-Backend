class AddInfoToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :height, :string
    add_column :players, :position, :string
    add_column :players, :weight, :integer
    add_column :players, :teamName, :string
    add_column :players, :college, :string
    add_column :players, :country, :string
    add_column :players, :pro, :string
  end
end
