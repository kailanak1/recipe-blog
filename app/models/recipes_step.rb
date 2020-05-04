class RecipesStep < ApplicationRecord
    belongs_to :recipe
    belongs_to :step 
    
end