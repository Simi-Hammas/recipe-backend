require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  before(:each) do
    @user = User.new(username: 'selma',
                     bio: 'Algerian Chef',
                     email: 'selma@gmail.com',
                     password: 'selma123',
                     photo: '',
                     country: 'Algeria',
                     public_name: 'Algerian Chef',
                     recipes_counter: 0,
                     saved_recipes_counter: 0)

    @recipe = Recipe.new(
      title: 'Chicken Biryani',
      description: 'Made of Chicken and Rice',
      preparation_time: '60',
      cooking_time: '60',
      ease_of_preparation: 'Medium',
      notes: 'NA',
      method: 'Coming Soon  Inshallah',
      photo: 'https://healux.in/wp-content/uploads/2020/11/ChickenBiryani.jpg',
      recipe_type: ['Non-Veg'],
      country: 'Pakistan',
      accessible: true,
      deleted_recipe: false,
      user: @user,
      comments_counter: 0,
      likes_counter: 0
    )
    @ingredient = Ingredient.new(name: 'salt', photo: '', description: 'normal mineral salt', user: @user)
    @recipe_ingredient = RecipeIngredient.new(quantity: '2/3', unit: 'tablespoons', optional: true, recipe: @recipe,
                                              ingredient: @ingredient)
  end

  describe 'Testing the recipe ingredient model validations' do
    it 'recipe ingredient should be valid' do
      expect(@recipe_ingredient).to be_valid
    end

    it 'the Recipe_Ingredient should belong to a recipe' do
      @recipe_ingredient.recipe = nil
      expect(@recipe_ingredient).to_not be_valid
    end

    it 'the Recipe_Ingredient should belong to a ingredient' do
      @recipe_ingredient.ingredient = nil
      expect(@recipe_ingredient).to_not be_valid
    end
  end
  describe 'Testing the recipe ingredient model validations: Quantity' do
    it 'Recipe_Ingredient\'s quantity must be a present' do
      @recipe_ingredient.quantity = nil
      expect(@recipe_ingredient).to_not be_valid
    end

    it 'Recipe_Ingredient\'s quantity should be a string of length in the range of 1 to 50 characters' do
      @recipe_ingredient.quantity = '1,5'
      expect(@recipe_ingredient.quantity.length).to be <= 50
      expect(@recipe_ingredient.quantity.length).to be >= 1
      expect(@recipe_ingredient).to be_valid
    end

    it 'Recipe_Ingredient\'s quantity should be a string of length less or equal to 50 characters' do
      @recipe_ingredient.quantity = '1,5' * 20
      expect(@recipe_ingredient.quantity.length).to be >= 50

      expect(@recipe_ingredient).to_not be_valid
    end

    it 'Recipe_Ingredient\'s quantity should not accept a string of length less than 1 character' do
      @recipe_ingredient.quantity = ''
      expect(@recipe_ingredient.quantity.length).to be < 1

      expect(@recipe_ingredient).to_not be_valid
    end
  end
  describe 'Testing the recipe ingredient model validations: Unit' do
    it 'Recipe_Ingredient\'s unit must be a present' do
      @recipe_ingredient.unit = nil
      expect(@recipe_ingredient).to_not be_valid
    end

    it 'Recipe_Ingredient\'s unit must be a present' do
      @recipe_ingredient.unit = nil
      expect(@recipe_ingredient).to_not be_valid
    end

    it 'Recipe_Ingredient\'s unit should be a string of length in the range of 1 to 50 characters' do
      @recipe_ingredient.unit = 'L'
      expect(@recipe_ingredient.unit.length).to be <= 50
      expect(@recipe_ingredient.unit.length).to be >= 1
      expect(@recipe_ingredient).to be_valid
    end

    it 'Recipe_Ingredient\'s unit should be a string of length less or equal to 50 characters' do
      @recipe_ingredient.unit = 'grams' * 20
      expect(@recipe_ingredient.unit.length).to be >= 50

      expect(@recipe_ingredient).to_not be_valid
    end

    it 'Recipe_Ingredient\'s unit should not accept a string of length less than 1 character' do
      @recipe_ingredient.unit = ''
      expect(@recipe_ingredient.unit.length).to be < 1

      expect(@recipe_ingredient).to_not be_valid
    end
  end
  describe 'Testing the recipe_ingredient model validations: Optional' do
    it 'recipe_ingredient should contain true/false for optional boolean' do
      @recipe_ingredient.optional = true
      expect(@recipe_ingredient).to be_valid
      @recipe_ingredient.optional = false
      expect(@recipe_ingredient).to be_valid
    end

    it 'recipe_ingredient should not contain any value other than true/false for optional boolean' do
      @recipe_ingredient.optional = nil
      expect(@recipe_ingredient).to_not be_valid
    end
  end
end
