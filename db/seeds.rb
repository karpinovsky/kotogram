1.upto(3) do |i|
  user = User.new(
    email: "user#{i}@kotogram.ru",
    password: 'kotogram',
    password_confirmation: 'kotogram',
    confirmed_at: Time.now,
    username: "user#{i}@kotogram.ru",
    full_name: "user#{i}",
    about_me: "Hi, I'am #{i} user"
  )

  user.skip_confirmation!
  user.save!
end
