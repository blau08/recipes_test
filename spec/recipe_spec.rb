require('spec_helper')

describe(Recipe) do
  describe('#ingredients') do
    it('lists a list of ingredients') do
      test_recipe = Recipe.create(:name => "Pizza")
      test_ingredient = Ingredient.create(:name => "Cheese")
      test_recipe.ingredients.push(test_ingredient)
      expect(test_recipe.ingredients()).to(eq([test_ingredient]))
    end
  end
end
