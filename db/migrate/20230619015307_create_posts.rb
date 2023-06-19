class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :author_name
      t.string :image_url

      t.timestamps
    end
  end
end
