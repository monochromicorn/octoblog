class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.integer :owner_id
      t.string :url_slug

      t.timestamps null: false
    end
  end
end
