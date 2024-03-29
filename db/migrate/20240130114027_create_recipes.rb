class CreateRecipes < ActiveRecord::Migration[7.1]
    def change
      create_table :recipes do |t|
        t.string :name
        t.decimal :preparation_time
        t.decimal :cooking_time
        t.string :description
        t.boolean :public
  
        t.timestamps
      end
    end
  end