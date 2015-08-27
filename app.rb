require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require "pry"
get("/") do
  erb(:index)
end

ActiveRecord::Base.establish_connection(ENV['postgres://vximxpeknhtqrl:7-4SCy44fc1ehnSwMSJRDIuoR7@ec2-23-23-188-252.compute-1.amazonaws.com:5432/da4q8pst35uv41'])

get("/recipes") do
  # recipe_id = params.fetch('recipe_id')
  # @recipe = Recipe.find(recipe_id)
  @recipes = Recipe.order('rating DESC')
  # binding.pry

  erb(:recipes)
end

post("/recipe") do
  recipe = Recipe.create({name: params.fetch("name")})
  @recipes = Recipe.order('rating DESC')
  erb(:recipes)
end


post("/instruction") do
  @recipe = Recipe.find(params.fetch("recipe_id").to_i)
  @recipe.update({instructions: params.fetch("instruction")})
  @ingredients = Ingredient.all()
  erb(:recipe)
end

get("/recipe/:id") do
  recipe_id = params.fetch("id").to_i
  @recipe = Recipe.find(recipe_id)
  @category = Category.all()
  @ingredients = Ingredient.all()
  erb(:recipe)
end

patch("/recipe/:id") do
  ingredient_ids = params.fetch("ingredient_ids")
  @recipe = Recipe.find(params.fetch("id").to_i())

  ingredient_ids.each() do |ingredient_id|
    ingredient = Ingredient.find(ingredient_id.to_i())
    @recipe.ingredients.push(ingredient)
  end

  @ingredients = Ingredient.all()
  erb(:recipe)
end

delete('/recipe/:id') do
  recipe_id = params.fetch("id").to_i
  recipe = Recipe.find(recipe_id)
  recipe.delete
  @recipes = Recipe.all()
  erb(:recipes)
end

patch("/recipe_rating") do
  @recipe = Recipe.find(params.fetch('recipe_id').to_i)
  @recipe.update({rating: params.fetch('rating').to_i})
  @ingredients = Ingredient.all()
  erb(:recipe)
end

get("/ingredients") do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post("/ingredient") do
  recipe = Ingredient.create({name: params.fetch("name")})
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

delete('/ingredient/:id') do
  ingredient_id = params.fetch("id").to_i
  ingredient = Ingredient.find(ingredient_id)
  ingredient.delete
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

get("/ingredient/:id") do
  ingredient_id = params.fetch("id").to_i
  @ingredient = Ingredient.find(ingredient_id)
  erb(:ingredient)
end

get("/categories") do
  @categories = Category.all()
  erb(:categories)
end

get("/category/:id") do
  category_id = params.fetch("id").to_i
  @category = Category.find(category_id)
  @recipes = Recipe.all()
  erb(:category)
end

post("/category") do
  @category = Category.create({name: params.fetch("name")})
  @categories = Category.all()
  @recipes = Recipe.all()
  erb(:category)
end

patch("/category/:id") do
  recipe_ids = params.fetch("recipe_ids")
  @category = Category.find(params.fetch("id").to_i())
  recipe_ids.each() do |recipe_id|
    recipe = Recipe.find(recipe_id.to_i())
    @category.recipes.push(recipe)
  end
  @recipes = Recipe.all()
  erb(:category)
end

patch("/category/:id") do
  recipe_ids = params.fetch("recipe_ids")
  @category = Category.find(params.fetch("id").to_i())

  recipe_ids.each() do |recipe_id|
    recipe = Recipe.find(recipe_id.to_i())
    @category.recipes.push(recipe)
  end
  @recipes = Recipe.all()
  erb(:category)
end

delete('/category/:id') do
  category_id = params.fetch("id").to_i
  category = Category.find(category_id)
  category.delete
  @categories = Category.all()
  erb(:categories)
end
