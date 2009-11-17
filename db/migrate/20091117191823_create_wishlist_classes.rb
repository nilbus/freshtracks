class CreateWishlistClasses < ActiveRecord::Migration
  def self.up
    create_table :wishlist_classes do |t|
      t.integer :section_id

      t.timestamps
    end
  end

  def self.down
    drop_table :wishlist_classes
  end
end
