class Recipe < ApplicationRecord
    validates :title, presence: true
    belongs_to :user 
    has_many :steps 
    has_many :ingredients 

    has_many :recipes_tags 
    has_many :tags, through: :recipes_tags
    
   

end
