# frozen_string_literal: true

# articles table added with reference
class Addforeignkey < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :author, foreign_key: true
  end
end
