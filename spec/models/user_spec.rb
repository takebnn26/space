require 'rails_helper'

describe User do
  it 'is valid with name, email, password, password_confirmation' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is invalid with name for nil' do
    user = build(:user, name: '')
    user.valid?
    expect(user.errors.messages[:name]).to include("can't be blank")
  end

  it 'is invalid with name for already exist' do
    user = create(:user, name: 'hayato')
    another_user = build(:user, name: 'hayato')
    another_user.valid?
    expect(another_user.errors.messages[:name]).to include('has already been taken')
  end

  it 'is invalid with email for nil' do
    user = build(:user, email: '')
    user.valid?
    expect(user.errors.messages[:email]).to include("can't be blank")
  end

  it 'is invalid with email for already exist' do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors.messages[:email]).to include('has already been taken')
  end

  it 'is invalid with password for nil' do
    user = build(:user, password: '')
    user.valid?
    expect(user.errors.messages[:password]).to include("can't be blank")
  end

  it 'is invalid password for defference of password_confirmation' do
    user = build(:user, password: 'aaaaaaaa')
    user.valid?
    expect(user.errors.messages[:password_confirmation]).to include("doesn't match Password")
  end

  it 'is invalid password for lower characters' do
    user = build(:user, password: 'aaaaa', password_confirmation: 'aaaaa')
    user.valid?
    expect(user.errors.messages[:password]).to include('is too short (minimum is 8 characters)')
  end
end
