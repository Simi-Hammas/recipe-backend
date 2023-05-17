require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(username: 'akram', bio: 'Algerian Chef', email: 'akram@gmail.com', password: 'akram123',
                     photo: '', country: 'Algeria', public_name: 'Algerian Chef')
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
  end

  describe 'Testing the recipe model validations: title' do
    it 'Recipe should be valid' do
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid without title' do
      @recipe.title = nil
      expect(@recipe).to_not be_valid
    end

    it 'recipe\'s title should be of length greater than or equal than 3' do
      @recipe.title = 'La'
      expect(@recipe).to_not be_valid
    end

    it 'recipe\'s title should be of length less than or equal than 200' do
      @recipe.title = 'a' * 201
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: description' do
    it 'recipe is not valid without description' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'recipe\'s description should be of length greater than or equal than 15' do
      @recipe.description = 'La description'
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: method' do
    it 'recipe is not valid without method' do
      @recipe.method = nil
      expect(@recipe).to_not be_valid
    end

    it 'recipe\'s method should be of length greater than or equal than 15' do
      @recipe.method = 'La méthode'
      expect(@recipe).to_not be_valid
    end
  end

  ########################################
  describe 'Testing the recipe model validations: preparation_time' do
    it 'recipe is  valid if preparation_time is an integer between 0 and 9999' do
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid without preparation_time' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'recipe is valid if preparation_time is of string type' do
      @recipe.preparation_time = '23'
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid if preparation_time is greater than 9999' do
      @recipe.preparation_time = 10_000
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if preparation_time has non numerical characters' do
      @recipe.preparation_time = '23minutes'
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if preparation_time is not an integer' do
      @recipe.preparation_time = 23.3
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if preparation_time is a negatif number' do
      @recipe.preparation_time = -23
      expect(@recipe).to_not be_valid
    end
  end

  ########################################
  describe 'Testing the recipe model validations: cooking_time' do
    it 'recipe is  valid if cooking_time is an integer between 0 and 9999' do
      @recipe.cooking_time = 23
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid without cooking_time' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if cooking_time is of string type' do
      @recipe.cooking_time = '23'
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid if cooking_time is greater than 9999' do
      @recipe.cooking_time = 10_000
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if cooking_time has non numerical characters' do
      @recipe.cooking_time = '23 minutes'
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if cooking_time is not an integer' do
      @recipe.cooking_time = 23.3
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if cooking_time is a negatif number' do
      @recipe.cooking_time = - 23
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: ease_of_preparation' do
    it 'recipe is valid if ease_of_preparation is valid' do
      @recipe.ease_of_preparation = 'Fairly easy'
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid without preparation_time' do
      @recipe.ease_of_preparation = nil
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: photo' do
    it 'recipe is valid if photo is valid' do
      @recipe.photo = 'https://img.freepik.com/free-photo/top-view-pepperoni-pizza-with-mushroom-sausages-bell-pepper-olive-corn-black-wooden_141793-2158.jpg?w=2000'
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid without photo' do
      @recipe.photo = nil
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: recipe_type ' do
    it 'recipe is valid if recipe_type is valid' do
      @recipe.recipe_type = 'Main dish'
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid without recipe_type' do
      @recipe.recipe_type = nil
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: country' do
    it 'recipe is not valid without country' do
      @recipe.country = nil
      expect(@recipe).to_not be_valid
    end

    it 'recipe\'s country should be of length greater than or equal than 3' do
      @recipe.country = 'La'
      expect(@recipe).to_not be_valid
    end

    it 'recipe\'s country should be of length less than or equal than 50' do
      @recipe.country = 'a' * 51
      expect(@recipe).to_not be_valid
    end

    it 'recipe\'s country should contain only letters' do
      @recipe.country = 'Algeria1'
      expect(@recipe).to_not be_valid
    end

    it 'recipe\'s country should not be empty' do
      @recipe.country = ''
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: accessible' do
    it 'recipe should contain true/false for accessible boolean' do
      @recipe.accessible = true
      expect(@recipe).to be_valid
      @recipe.accessible = false
      expect(@recipe).to be_valid
    end

    it 'recipe should not contain any value other than true/false for accessible boolean' do
      @recipe.accessible = nil
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: deleted_recipe' do
    it 'recipe should contain true/false for deleted boolean' do
      @recipe.deleted_recipe = true
      expect(@recipe).to be_valid
      @recipe.deleted_recipe = false
      expect(@recipe).to be_valid
    end

    it 'recipe should not contain any value other than true/false for deleted boolean' do
      @recipe.deleted_recipe = nil
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: comments_counter' do
    it 'recipe is valid if comments_counter is an integer greater or equal than 0' do
      @recipe.comments_counter = 23
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid without comments_counter' do
      @recipe.comments_counter = nil
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if comments_counter is of string type' do
      @recipe.comments_counter = '23'
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid if comments_counter is decimal' do
      @recipe.comments_counter = 23.0
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if comments_counter has non numerical characters' do
      @recipe.comments_counter = '23 likes'
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if comments_counter is not an integer' do
      @recipe.comments_counter = 23.3
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if comments_counter is a negatif number' do
      @recipe.comments_counter = - 23
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: likes_counter' do
    it 'recipe is valid if likes_counter is an integer greater or equal than 0' do
      @recipe.likes_counter = 23
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid without likes_counter' do
      @recipe.likes_counter = nil
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if likes_counter is of string type' do
      @recipe.likes_counter = '23'
      expect(@recipe).to be_valid
    end

    it 'recipe is not valid if likes_counter is decimal' do
      @recipe.likes_counter = 23.0
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if likes_counter has non numerical characters' do
      @recipe.likes_counter = '23 likes'
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if likes_counter is not an integer' do
      @recipe.likes_counter = 23.3
      expect(@recipe).to_not be_valid
    end

    it 'recipe is not valid if likes_counter is a negatif number' do
      @recipe.likes_counter = - 23
      expect(@recipe).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: user' do
    it 'recipe should belong to a user' do
      @recipe.user = nil
      expect(@recipe).to_not be_valid
    end
  end
end
