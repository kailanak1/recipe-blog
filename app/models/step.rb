class Step < ApplicationRecord
    belongs_to :recipe 
    validates :step_summary, presence: true
end
