class CreateClasses < ActiveRecord::Migration
  def self.up
    create_table :classes do |t|
      t.string :name
      t.string :subject
      t.string :number
      t.string :description
      t.string :searchkey

      t.timestamps
    end
  end

  def self.down
    drop_table :classes
  end
end
