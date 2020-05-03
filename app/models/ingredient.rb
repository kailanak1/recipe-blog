class Ingredient < ApplicationRecord
    validates :name, presence: true
    has_many :ingredients_recipes
    has_many :recipes, through: :ingredients_recipes

    # accepts_nested_attributes_for :recipe
end
