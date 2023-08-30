require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when user create' do 
    it 'creates user' do
      user = User.create(
        full_name: 'ABCyuguy',email:"aqsa11@gmail.com",password:'aqsa1234',id: 34
      )
      expect(user).to be_valid
    end

    it 'fails if user full_name length less than 5 symbols' do
      user =  User.create(
        full_name: 'AB',
        email:"sami100@gmail.com",
        password: "sami1000",
        id: 89
      )
      expect(
        user.errors.messages[:full_name]
      ).to eq(['is too short (minimum is 5 characters)'])
    end

    it 'fails if title is of whitespaces ' do
      user = User.create(
        full_name: '        ',
        email:'mkdas33@gmail.com',
        password:'mkdas34',
        id:222
      )
      expect(
        user.errors.messages[:full_name]
      ).to eq(["can't be blank"])
    end
    
  end
end