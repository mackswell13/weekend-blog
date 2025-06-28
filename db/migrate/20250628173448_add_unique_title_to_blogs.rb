class AddUniqueTitleToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_index :blogs, :title, unique: true
  end
end
