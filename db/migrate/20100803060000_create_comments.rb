class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :tab_id
      t.text :body
      t.string :username

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
