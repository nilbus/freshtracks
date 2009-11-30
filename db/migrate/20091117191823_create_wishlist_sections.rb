class CreateWishlistSections < ActiveRecord::Migration
  def self.up
    create_table :wishlist_sections do |t|
      t.integer :section_id

      t.timestamps
    end
  end

  def self.down
    drop_table :wishlist_sections
  end
end
