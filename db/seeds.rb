10.times do |n|
  user = User.new(
    email: "example#{n}@kotogram.ru",
    password: "example",
    password_confirmation: "example",
    confirmed_at: Time.now
  )

  user.skip_confirmation!
  user.save!

  Profile.create(
    user_id: user.id,
    user_username: "example#{n}"
  )
end
