require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.new(username: 'selma', bio: 'Algerian Chef', email: 'selma@gmail.com', password: 'selma1234',
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
    @like = Like.new(liked: true, user: @user, recipe: @recipe)
  end

  describe 'Testing the like model validations' do
    it 'like should be valid' do
      expect(@like).to be_valid
    end

    it 'like should contain true/false for liked boolean' do
      @like.liked = true
      expect(@like).to be_valid
      @like.liked = false
      expect(@like).to be_valid
    end

    it 'like should not contain any value other than true/false for liked boolean' do
      @like.liked = nil
      expect(@like).to_not be_valid
    end

    it 'like should belong to a user' do
      @like.user = nil
      expect(@like).to_not be_valid
    end

    it 'like should belong to a recipe' do
      @like.recipe = nil
      expect(@like).to_not be_valid
    end
  end
end
