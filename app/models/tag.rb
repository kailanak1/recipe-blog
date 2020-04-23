class Tag < ApplicationRecord
    has_many :recipes_tags 
    has_many :recipes, through: :recipes_tag

    validates :name, presence: true
   


    #code courtesty of Nouran Mahmoud (some edits were made)
    def all_tags=(names)
        self.tags = names.split(",").map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end
          
    def all_tags
        self.tags.map(&:name).join(", ")
    end
          
    def self.tagged_with(name)
        Tag.find_by_name!(name).recipes
    end
end
