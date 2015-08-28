require('spec_helper')

describe(Ingredient) do
  describe('#recipe') do
    it('returns a recipe for the ingredient') do
      test_ingredient = Ingredient.create(:name => "Cheese")
      test_recipe = Recipe.create(:name => "Pizza")
      test_ingredient.recipes.push(test_recipe)
      expect(test_ingredient.recipes()).to(eq([test_recipe]))
    end
  end
end
