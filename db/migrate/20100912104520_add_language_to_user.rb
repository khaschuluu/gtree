class AddLanguageToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :language, :text
  end

  def self.down
    remove_column :users, :language
  end
end
