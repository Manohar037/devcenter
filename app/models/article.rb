
class Article < ApplicationRecord
	validates :title, presence: true
                    
    validates :text, length: { minimum: 10 }

    before_save :addchars
    private
    def addchars
      self.text_chars_count = text.size
    end
end
