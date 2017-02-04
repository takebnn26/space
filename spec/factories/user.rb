require 'faker'

FactoryGirl.define do
  factory :user do

    password = Faker::Lorem.characters(8)

    name                  Faker::Name.name
    email                 Faker::Internet.email
    password              password
    password_confirmation password
  end
end
