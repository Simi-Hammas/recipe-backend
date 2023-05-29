require 'rails_helper'

RSpec.describe Ingredient, type: :model do
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

    @ingredient = Ingredient.new(name: 'salt', photo: '', description: 'normal mineral salt', user: @user)
  end

  describe 'Testing the ingredient model validations' do
    it 'Ingredient should be valid' do
      expect(@ingredient).to be_valid
    end

    it 'Ingredient is not valid without name' do
      @ingredient.name = nil
      expect(@ingredient).to_not be_valid
    end

    it 'Ingredient\'s name should be of length greater than or equal than 3' do
      @ingredient.name = 'La'
      expect(@ingredient).to_not be_valid
    end

    it 'Ingredient\'s name should be of length less than or equal than 200' do
      @ingredient.name = 'a' * 201
      expect(@ingredient).to_not be_valid
    end

    it 'Ingredient\'s name should contains only letters, numbers, and spaces' do
      @ingredient.name = 'salt&sugar'
      expect(@ingredient).to_not be_valid
    end

    it 'Presence of description is optional' do
      @ingredient.description = nil
      expect(@ingredient).to_not be_valid
    end

    it 'Ifdescription is present, its length should be greater or equal to 15' do
      @ingredient.description = 'a' * 14
      expect(@ingredient).to_not be_valid
    end

    it 'the Ingredient should belong to a user' do
      @ingredient.user = nil
      expect(@ingredient).to_not be_valid
    end
  end
end
