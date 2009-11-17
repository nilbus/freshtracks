class CreateRegisteredClasses < ActiveRecord::Migration
  def self.up
    create_table :registered_classes do |t|
      t.integer :section_id

      t.timestamps
    end
  end

  def self.down
    drop_table :registered_classes
  end
end
