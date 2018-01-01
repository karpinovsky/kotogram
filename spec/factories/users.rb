FactoryBot.define do
  factory :user do
    email                 'email@kotogram.ru'
    password              'password'
    password_confirmation 'password'

    factory :user_with_profile do
      before(:create) do |user|
        build(:profile, user: user)
        user.skip_confirmation!
      end

      after(:build) do |user|
        build(:profile, user: user)
      end
    end
  end

  factory :profile do
    username 'username'
    full_name 'fullname'
  end
end
