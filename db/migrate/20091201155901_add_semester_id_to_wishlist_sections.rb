class AddSemesterIdToWishlistSections < ActiveRecord::Migration
  def self.up
    add_column :wishlist_sections, :semester_id, :integer
  end

  def self.down
    remove_column :wishlist_sections, :semester_id
  end
end
