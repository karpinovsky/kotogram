FactoryGirl.define do
  factory :user do
    email                 'email@kotogram.ru'
    name                  'name'
    username              'username'
    password              'password'
    password_confirmation 'password'
  end
end
