class GenerateSearchkeyForCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :searchkey, :text
    Course.update_all("searchkey = subject || number || ' - ' || name")
  end

  def self.down
    remove_column :courses, :searchkey
  end
end
