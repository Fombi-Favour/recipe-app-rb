class CreateInventoryFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.references :inventories, foreign_key: { to_table: 'inventories' }
      t.references :foods, foreign_key: { to_table: 'foods'}

      t.timestamps
    end
  end
end
