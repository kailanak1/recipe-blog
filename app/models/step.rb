class Step < ApplicationRecord
 

    has_many :recipes_steps 
    has_many :recipes, through: :recipes_steps

    # validates :step_summary, presence: true
    accepts_nested_attributes_for :recipes

end
