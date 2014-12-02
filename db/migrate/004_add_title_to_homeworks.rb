class AddTitleToHomeworks < ActiveRecord::Migration
  def self.up
    add_column :homeworks, :title, :string, null: false
  end

  def self.down
    remove_column :homeworks, :title, :string, null: false
  end
end
