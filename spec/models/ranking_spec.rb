require 'rails_helper'

RSpec.describe Ranking, type: :model do
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
    @ranking = Ranking.new(stars: 2, user: @user, recipe: @recipe)
  end

  describe 'Testing the ranking model validations' do
    it 'ranking should be valid' do
      expect(@ranking).to be_valid
    end

    it 'Ranking should not be out of the range of 1 to 5 stars' do
      expect(@ranking.stars).to be >= 1
      expect(@ranking.stars).to be <= 5
      @ranking.stars = 6
      expect(@ranking).to_not be_valid
    end

    it 'Ranking should not contain any value other than 1,2,3,4, and 5 for stars attribute' do
      @ranking.stars = nil
      expect(@ranking).to_not be_valid
    end

    it 'Ranking should not be valid if stars equals empty string' do
      @ranking.stars = ''
      expect(@ranking).to_not be_valid
    end

    it 'Ranking should belong to a user' do
      @ranking.user = nil
      expect(@ranking).to_not be_valid
    end

    it 'Ranking should belong to a recipe' do
      @ranking.recipe = nil
      expect(@ranking).to_not be_valid
    end
  end
end
