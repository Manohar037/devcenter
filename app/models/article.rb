
class Article < ApplicationRecord
	validates :title, presence: true
                 
    validates :author, presence: true
                    
    validates :text, length: { minimum: 10 }
end
