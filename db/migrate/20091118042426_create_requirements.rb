class CreateRequirements < ActiveRecord::Migration
  def self.up
    create_table :requirements do |t|
      t.integer :class_id
      t.integer :needs_id

      t.timestamps
    end
  end

  def self.down
    drop_table :requirements
  end
end
