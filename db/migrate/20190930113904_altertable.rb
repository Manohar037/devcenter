# frozen_string_literal: true

# articles table structure change
class Altertable < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :author, :string
  end
end
