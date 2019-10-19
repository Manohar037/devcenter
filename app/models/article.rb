# frozen_string_literal: true

# class/model for Articles
class Article < ApplicationRecord
  def aut_name=(name)
    self.author = Author.find_or_create_by(author_name: name)
  end

  def aut_name
    author ? author.author_name : nil
  end

  belongs_to :author
  validates :title, presence: true

  validates :text, length: { minimum: 10 }

  before_save :addchars

  private

  def addchars
    self.text_chars_count = text.size
  end
end
