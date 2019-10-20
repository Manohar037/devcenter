# frozen_string_literal: true

# articles table structure change
class Removeauthor < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :author, :string
  end
end
