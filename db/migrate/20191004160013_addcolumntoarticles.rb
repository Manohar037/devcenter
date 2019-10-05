class Addcolumntoarticles < ActiveRecord::Migration[6.0]
  def change
  	add_column :articles, :text_chars_count, :integer
  end
end
