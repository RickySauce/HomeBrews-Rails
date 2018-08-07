class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :boil_size
      t.integer :batch_size
      t.float :og
      t.float :fg
      t.float :abv
      t.integer :ibu
      t.integer :user_id
      t.integer :sub_style_id
      t.timestamps
    end
  end
end
