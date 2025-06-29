class CreateLinkedBlogs < ActiveRecord::Migration[8.0]
  def change
    create_table :linked_blogs do |t|
      t.string :title
      t.string :href
      t.timestamps
    end
  end
end
