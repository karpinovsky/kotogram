1.upto(3) do |i|
  user = User.new(
    email: "kotogram#{i}@kotogram.ru",
    password: 'kotogram',
    password_confirmation: 'kotogram',
    confirmed_at: Time.now,
    username: "kotogram#{i}",
    full_name: "kotogram#{i}",
    about_me: "Hi, I'am #{i} user"
  )

  user.skip_confirmation!
  user.save!
end
