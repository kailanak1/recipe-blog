class Step < ApplicationRecord
    belongs_to :recipe 

    has_many :recipes_steps 
    has_many :recipes, through: :recipes_steps

    # validates :step_summary, presence: true
    accepts_nested_attributes_for :recipe

end
