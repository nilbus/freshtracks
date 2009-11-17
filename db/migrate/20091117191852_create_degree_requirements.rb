class CreateDegreeRequirements < ActiveRecord::Migration
  def self.up
    create_table :degree_requirements do |t|
      t.integer :class_id
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :degree_requirements
  end
end
