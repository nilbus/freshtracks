class DegreeRequirement < ActiveRecord::Base
  belongs_to :required, :polymorphic => true
end
