# frozen_string_literal: true

# authors table creation
class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :author_name

      t.timestamps
    end
  end
end
