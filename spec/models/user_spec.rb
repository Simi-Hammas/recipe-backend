require 'rails_helper'

RSpec.describe User, type: :model do
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
  end

  describe 'Testing the recipe model validations: username' do
    it 'User should be valid' do
      expect(@user).to be_valid
    end

    it 'User is not valid without username' do
      @user.username = nil
      expect(@user).to_not be_valid
    end

    it 'User\'s username should be of length greater than or equal than 3' do
      @user.username = 'La'
      expect(@user).to_not be_valid
    end

    it 'User\'s username should be of length less than or equal than 200' do
      @user.username = 'a' * 201
      expect(@user).to_not be_valid
    end

    it 'User\'s username should contain only letters, numbers, dashes and underscores' do
      @user.username = 'Akram&Mehdi'
      expect(@user).to_not be_valid
    end

    it 'User\'s username should contain only letters, numbers, dashes and underscores' do
      @user.username = 'Ak-ram_Meh-di-1'
      expect(@user).to be_valid
    end
  end
  ##########################
  describe 'Testing the recipe model validations: email' do
    it 'User is not valid without email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'User is not valid if email is empty' do
      @user.email = ''
      expect(@user).to_not be_valid
    end

    it 'User\'s email should be of length greater than or equal than 6' do
      @user.email = 'a@b.c'
      expect(@user).to_not be_valid
    end

    it 'User\'s email should be of length less than or equal than 255' do
      @user.email = 'a@b.co' * 34
      expect(@user).to_not be_valid
    end

    it 'User\'s email should be a valid email address: contains the @' do
      @user.email = 'akram.com'
      expect(@user).to_not be_valid
    end

    # it 'User\'s email should be a valid email address: contains the period' do
    #   @user.email = 'akram@co'
    #   expect(@user).to be_valid
    # end
  end
  ################################
  describe 'Testing the recipe model validations: country' do
    it 'user is not valid without country' do
      @user.country = nil
      expect(@user).to_not be_valid
    end

    it 'user\'s country should be of length greater than or equal than 3' do
      @user.country = 'La'
      expect(@user).to_not be_valid
    end

    it 'user\'s country should be of length less than or equal than 60' do
      @user.country = 'a' * 61
      expect(@user).to_not be_valid
    end

    it 'user\'s country should contain only letters' do
      @user.country = 'Algeria1'
      expect(@user).to_not be_valid
    end

    it 'user\'s country should not be empty' do
      @user.country = ''
      expect(@user).to_not be_valid
    end
  end
  #####################################
  describe 'Testing the recipe model validations: public_name' do
    it 'User is not valid without public_name' do
      @user.public_name = nil
      expect(@user).to_not be_valid
    end

    it 'User\'s public_name should be of length greater than or equal than 3' do
      @user.public_name = 'La'
      expect(@user).to_not be_valid
    end

    it 'User\'s public_name should be of length less than or equal than 200' do
      @user.public_name = 'a' * 201
      expect(@user).to_not be_valid
    end

    it 'User\'s public_name should contain only letters, numbers, dashes and underscores' do
      @user.public_name = 'Akram&Mehdi'
      expect(@user).to_not be_valid
    end

    it 'User\'s public_name should contain only letters, numbers, dashes and underscores' do
      @user.public_name = 'Ak-ram_Meh-di-1'
      expect(@user).to be_valid
    end
  end
  ######################################
  describe 'Testing the user model validations: bio' do
    it 'user\'s bio should not be empty' do
      @user.bio = ''
      expect(@user).to_not be_valid
    end

    it 'user\'s bio should be of length less than or equal than 3500' do
      @user.bio = 'L' * 3501
      expect(@user).to_not be_valid
    end
  end

  describe 'Testing the recipe model validations: recipes_counter' do
    it 'user is valid if recipes_counter is an integer greater or equal than 0' do
      @user.recipes_counter = 23
      expect(@user).to be_valid
    end

    it 'user is not valid without recipes_counter' do
      @user.recipes_counter = nil
      expect(@user).to_not be_valid
    end

    it 'user is not valid if recipes_counter is of string type' do
      @user.recipes_counter = '23'
      expect(@user).to be_valid
    end

    it 'user is not valid if recipes_counter is decimal' do
      @user.recipes_counter = 23.0
      expect(@user).to_not be_valid
    end

    it 'user is not valid if recipes_counter has non numerical characters' do
      @user.recipes_counter = '23 recipes'
      expect(@user).to_not be_valid
    end

    it 'user is not valid if recipes_counter is not an integer' do
      @user.recipes_counter = 23.3
      expect(@user).to_not be_valid
    end

    it 'user is not valid if recipes_counter is a negatif number' do
      @user.recipes_counter = - 23
      expect(@user).to_not be_valid
    end
  end
  ##############################################
  describe 'Testing the recipe model validations: saved_recipes_counter' do
    it 'user is valid if saved_recipes_counter is an integer greater or equal than 0' do
      @user.saved_recipes_counter = 23
      expect(@user).to be_valid
    end

    it 'user is not valid without saved_recipes_counter' do
      @user.saved_recipes_counter = nil
      expect(@user).to_not be_valid
    end

    it 'user is not valid if saved_recipes_counter is of string type' do
      @user.saved_recipes_counter = '23'
      expect(@user).to be_valid
    end

    it 'user is not valid if saved_recipes_counter is decimal' do
      @user.saved_recipes_counter = 23.0
      expect(@user).to_not be_valid
    end

    it 'user is not valid if saved_recipes_counter has non numerical characters' do
      @user.saved_recipes_counter = '23 recipes'
      expect(@user).to_not be_valid
    end

    it 'user is not valid if saved_recipes_counter is not an integer' do
      @user.saved_recipes_counter = 23.3
      expect(@user).to_not be_valid
    end

    it 'user is not valid if saved_recipes_counter is a negatif number' do
      @user.saved_recipes_counter = - 23
      expect(@user).to_not be_valid
    end
  end
end
