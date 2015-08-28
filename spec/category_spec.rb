require('spec_helper')

describe(Category) do
  describe('#recipe') do
    it('lets you add a recipe to a category') do
      test_category = Category.create(:name => "Breakfast")
      test_recipe = Recipe.create(:name => "Scrambled Eggs")
      test_category.recipes.push(test_recipe)
      expect(test_category.recipes()).to(eq([test_recipe]))
    end
  end
end
