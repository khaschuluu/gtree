class CreateTabs < ActiveRecord::Migration
  def self.up
    create_table :tabs do |t|
      t.string :title
      t.text :tab
      t.string :artist
      t.string :tag
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tabs
  end
end
