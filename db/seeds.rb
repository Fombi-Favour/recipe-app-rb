# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
first_user = User.create(name: 'Tom')
second_user = User.create(name: 'Lilly')

tomato = Food.create(name: 'Tomato',measurement_unit: 'g' , price: 2)
potato = Food.create(name: 'Potato',measurement_unit: 'g' , price: 2)
apple = Food.create(name: 'Apple',measurement_unit: 'g' , price: 3)
milk = Food.create(name: 'Milk',measurement_unit: 'g' , price: 1)



pure = Recipe.create(name: 'pure',preparation_time: 0.5,cooking_time: 20, description: 'Pure de papa', public: true,user: first_user)
soap = Recipe.create(name: 'soap',preparation_time: 0.5,cooking_time: 30, description: 'Sopa de tomate', public: true,user: second_user)


rf3 = RecipeFood.create(quantity:200,recipe_id: soap.id,food_id:tomato.id)
rf2 = RecipeFood.create(quantity:50,recipe_id: pure.id,food_id: milk.id)
rf1 = RecipeFood.create(quantity:400,recipe_id: pure.id,food_id:potato.id)
soap2 = Recipe.create(name: 'soap potato',preparation_time: 0.5,cooking_time: 30, description: 'Sopa de papa', public: false,user: second_user)


inv1 = Inventory.create(name: 'Inventory 1',description:'First inventory', user_id: first_user.id)
inv2 = Inventory.create(name: 'Inventory 2',description:'Second inventory', user: first_user)

invf1 = InventoryFood.create(quantity: 100,inventory: inv1 , food: potato)

