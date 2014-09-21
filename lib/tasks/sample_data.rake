namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
  end
end

def make_users
    email = "s@s.s"
    password  = "12345678"
    User.create!(email:    email,
                 password: password,
                 password_confirmation: password)
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = "Błogosławcie Pana. Za wszystko co dobre."
    users.each { |user| user.microposts.create!(content: content) }
  end
end