class Step < ApplicationRecord
    belongs_to :recipe 
    # validates :step_summary, presence: true
    accepts_nested_attributes_for :recipe
end
