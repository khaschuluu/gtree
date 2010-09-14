class AddCounterToTab < ActiveRecord::Migration
  def self.up
    add_column :tabs, :counter, :integer
  end

  def self.down
    remove_column :tabs, :counter
  end
end
