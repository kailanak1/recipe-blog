class Ingredient < ApplicationRecord
    validates :name, presence: true
    belongs_to :recipe 

    accepts_nested_attributes_for :recipe
end
