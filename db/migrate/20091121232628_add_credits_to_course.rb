class AddCreditsToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :credits, :integer
  end

  def self.down
    remove_column :courses, :credits
  end
end
