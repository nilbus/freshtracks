class AddUserIdToTables < ActiveRecord::Migration
  def self.up
    add_column :passed_courses, :user_id, :integer
    add_column :registered_sections, :user_id, :integer
    add_column :wishlist_sections, :user_id, :integer
  end

  def self.down
    remove_column :passed_courses, :user_id
    remove_column :registered_sections, :user_id
    remove_column :wishlist_sections, :user_id
  end
end
