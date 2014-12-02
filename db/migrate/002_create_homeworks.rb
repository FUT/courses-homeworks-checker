class CreateHomeworks < ActiveRecord::Migration
  def self.up
    create_table :homeworks do |t|
      t.text :description, null: false
      t.date :deadline, null: false
      t.integer :complexity, null: false
      t.timestamps
    end
  end

  def self.down
    drop_table :homeworks
  end
end
