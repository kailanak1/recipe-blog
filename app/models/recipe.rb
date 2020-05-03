class Recipe < ApplicationRecord
    validates :title, presence: true
    belongs_to :user 
    has_many :steps 
    
    has_many :ingredients_recipes
    has_many :ingredients, through: :ingredients_recipes

    has_many :recipes_tags 
    has_many :tags, through: :recipes_tags

    accepts_nested_attributes_for :ingredients 
    accepts_nested_attributes_for :tags 
    accepts_nested_attributes_for :steps
  
    
   

end
