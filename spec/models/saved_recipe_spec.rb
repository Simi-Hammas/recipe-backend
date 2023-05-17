require 'rails_helper'

RSpec.describe SavedRecipe, type: :model do
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
    @saved_recipe = SavedRecipe.new(saved: true, notes: '', user: @user, recipe: @recipe)
  end

  it 'the saved recipe should be valid' do
    expect(@saved_recipe).to be_valid
  end

  it 'the saved recipe should contain true/false for saved boolean attribute' do
    @saved_recipe.saved = true
    expect(@saved_recipe).to be_valid
    @saved_recipe.saved = false
    expect(@saved_recipe).to be_valid
  end

  it 'the saved recipe should not contain any value other than true/false for saved boolean attribute' do
    @saved_recipe.saved = nil
    expect(@saved_recipe).to_not be_valid
  end

  it 'the saved recipe should belong to a user' do
    @saved_recipe.user = nil
    expect(@saved_recipe).to_not be_valid
  end

  it 'the saved recipe should belong to a recipe' do
    @saved_recipe.recipe = nil
    expect(@saved_recipe).to_not be_valid
  end

  it 'the presence of the notes attribute is optional' do
    @saved_recipe.notes = nil
    expect(@saved_recipe).to be_valid
  end

  it 'if the notes attribute is present, its length can not take 0 letters' do
    @saved_recipe.notes = ''
    expect(@saved_recipe).to be_valid
  end

  it 'if the notes attribute is present, its length should be in range of 1 to 3500 letters' do
    @saved_recipe.notes = 'a' * 300
    expect(@saved_recipe).to be_valid
  end

  it 'if the notes attribute is present, its length should not be greater than 3500 letters' do
    @saved_recipe.notes = 'a' * 3501
    expect(@saved_recipe).to_not be_valid
  end
end
