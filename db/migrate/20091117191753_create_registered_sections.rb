class CreateRegisteredSections < ActiveRecord::Migration
  def self.up
    create_table :registered_sections do |t|
      t.integer :section_id

      t.timestamps
    end
  end

  def self.down
    drop_table :registered_sections
  end
end
