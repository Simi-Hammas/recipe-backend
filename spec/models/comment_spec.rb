require 'rails_helper'

RSpec.describe Comment, type: :model do
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
    @comment = Comment.new(comment_text: 'Yummy', deleted: false, user: @user, recipe: @recipe)
  end

  describe 'Testing the comments model validations' do
    it 'comment should be valid' do
      expect(@comment).to be_valid
    end
    it 'comment should be in range of 1 to 3500 letters' do
      expect(@comment.comment_text.length).to be >= 1
      expect(@comment.comment_text.length).to be <= 3500
    end
    it 'comment should not contain 0 text' do
      @comment.comment_text = ''
      expect(@comment).to_not be_valid
    end
    it 'comment should not contain letters more than 3500 characters' do
      @comment.comment_text = 'a' * 3501
      expect(@comment).to_not be_valid
    end
    it 'comment should contain true/false for deleted boolean' do
      @comment.deleted = true
      expect(@comment).to be_valid
      @comment.deleted = false
      expect(@comment).to be_valid
    end
    it 'comment should not contain any value other than true/false for deleted boolean' do
      @comment.deleted = nil
      expect(@comment).to_not be_valid
    end
  end
end
