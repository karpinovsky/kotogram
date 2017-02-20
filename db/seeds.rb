10.times do |n|
  user = User.new(
    email: "example#{n}@kotogram.ru",
    fullName: "example",
    username: "example#{n}",
    password: "example",
    password_confirmation: "example",
    confirmed_at: Time.now
  )
  user.skip_confirmation!
  user.save!
end
