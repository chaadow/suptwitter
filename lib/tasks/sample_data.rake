namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Chedli Bourguiba",
                       email:    "chedli.bourguiba@supinfo.com",
                       password: "chedli",
                       password_confirmation: "chedli",
                       admin: true)
   admin = User.create!(name:     "Guillaume occuly",
                       email:    "guillaume.occuly@supinfo.com",
                       password: "guillaume",
                       password_confirmation: "guillaume",
                       admin: true)
   admin = User.create!(name:     "Valentin Chong",
                       email:    "valentin.chong@supinfo.com",
                       password: "valentin",
                       password_confirmation: "valentin",
                       admin: true)
   admin = User.create!(name:     "Ayrton Ahouangonu",
                       email:    "ayrton.ahouangonu@supinfo.com",
                       password: "ayrton",
                       password_confirmation: "ayrton",
                       admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@supinfo.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 5)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[2..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end