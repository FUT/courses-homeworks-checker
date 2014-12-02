class CreateCompletedHomeworks < ActiveRecord::Migration
  def self.up
    create_table :completed_homeworks do |t|
      t.integer :account_id, null: false
      t.integer :homework_id, null: false
      t.text :answer
      t.string :url
      t.string :title
      t.boolean :approved, null: false, default: false
      t.timestamps
    end
  end

  def self.down
    drop_table :completed_homeworks
  end
end
