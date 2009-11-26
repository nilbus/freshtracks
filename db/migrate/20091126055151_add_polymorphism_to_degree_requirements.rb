class AddPolymorphismToDegreeRequirements < ActiveRecord::Migration
  def self.up
    add_column :degree_requirements, :required_id, :integer
    add_column :degree_requirements, :required_type, :string
    remove_column :degree_requirements, :course_id
    remove_column :degree_requirements, :group_id
  end

  def self.down
    remove_column :degree_requirements, :required_type
    remove_column :degree_requirements, :required_id
    add_column :degree_requirements, :course_id, :integer
    add_column :degree_requirements, :group_id, :integer
  end
end
