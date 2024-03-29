# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username:'selma', bio:'Algerian Chef', email:'selma@gmail.com', password: 'selma1234', photo:'123.png', country:'Algeria', public_name:'Algerian Chef', recipes_counter: 0, saved_recipes_counter: 0);

User.create(username:'hammas', bio:'Pakistani Chef', email:'hammas@gmail.com', password: 'hammas1234', photo:'hammas123.png', country:'Pakistan', public_name:'Pakistani Chef', recipes_counter: 0, saved_recipes_counter: 0);

Recipe.create(title: 'Couscous', description: 'Made of and small steamed balls of semolina wheat and chicken', method: 'Coming Soon Inshallah', preparation_time: 30, cooking_time: 60, ease_of_preparation: 'Medium', notes: 'NA', photo: 'https://rb.gy/f40b2', recipe_type: ['Non-Veg'], country: 'Algeria', accessible: false, deleted_recipe: false, user_id: 1, comments_counter: 0, likes_counter: 0);

Recipe.create(title: 'Chicken Biryani', description: 'Made of Chicken and Rice', preparation_time: '60', cooking_time: '60', ease_of_preparation: 'Medium', notes: 'NA', method: 'Coming Soon Inshallah', photo: 'https://healux.in/wp-content/uploads/2020/11/ChickenBiryani.jpg', recipe_type: ['Non-Veg'], country: 'Pakistan', accessible: true, deleted_recipe: false, user_id: 2, comments_counter: 0, likes_counter: 0);

Ingredient.create(name: 'Chicken', photo: 'https://www.allrecipes.com/thmb/qhJDqRRX1CkzlBJ9YDB7BME-vsg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Raw-Chicken-Mistakes-3x2-1-8a51428f2d5d46f3bc4dce8a5d1f32d3.png', description: 'Halal Chicken', user_id: 1);

RecipeIngredient.create(quantity: '1', unit: 'kg', optional: false, recipe_id: 1, ingredient_id: 1);


