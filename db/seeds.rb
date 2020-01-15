# ユーザ(かんたんログインで使用)
user = User.create!(user_name: 'test0',
                    email: 'test0@mail.com',
                    password: 'password',
                    password_confirmation: 'password',
                    confirmed_at: Time.zone.now,
                    confirmation_sent_at: Time.zone.now,
                    admin: false)

user.avatar = open("#{Rails.root}/db/fixtures/avatar.png")
user.save

user.build_profile
user.save

# その他のユーザ
15.times do |n|
  user_name = "test#{n + 1}"
  email = "test#{n + 1}@mail.com"
  password = 'password'
  admin = false

  other_users = User.create!(user_name: user_name,
                            email: email,
                            password: password,
                            password_confirmation: password,
                            confirmed_at: Time.zone.now,
                            confirmation_sent_at: Time.zone.now,
                            admin: admin)

  other_users.avatar = open("#{Rails.root}/db/fixtures/avatar#{n}.png")
  other_users.build_profile
  other_users.save
end

# 管理ユーザー
admin_user = User.create!(user_name: '管理人さん',
                          email: 'admin@mail.com',
                          password: 'password',
                          password_confirmation: 'password',
                          confirmed_at: Time.zone.now,
                          confirmation_sent_at: Time.zone.now,
                          admin: true)

admin_user.build_profile
admin_user.save

admin_user.avatar = open("#{Rails.root}/db/fixtures/avatar3.png")
admin_user.save

# 投稿
users = User.order(:created_at).take(15)
0.upto(5) do |n|
  image = open("#{Rails.root}/db/fixtures/room1.png")
  caption = 'これが私の部屋です。ポスターがお気に入りです。'
  tag_list = Faker::Lorem.words(3).join(",")
  users[0].posts.create!(
    image: image,
    caption: caption,
    tag_list: tag_list,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

6.upto(10) do |n|
  image = open("#{Rails.root}/db/fixtures/room2.png")
  caption = 'これが私の部屋です。デスクがお気に入りです。'
  users[1].posts.create!(
    image: image,
    caption: caption,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

11.upto(15) do |n|
  image = open("#{Rails.root}/db/fixtures/room3.png")
  caption = 'これが私の部屋です。ベッドがお気に入りです。'
  users[2].posts.create!(
    image: image,
    caption: caption,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

16.upto(20) do |n|
  image = open("#{Rails.root}/db/fixtures/room4.png")
  caption = 'これが私の部屋です。ラックがお気に入りです。'
  users[3].posts.create!(
    image: image,
    caption: caption,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

21.upto(25) do |n|
  image = open("#{Rails.root}/db/fixtures/room5.png")
  caption = 'これが私の部屋です。ソファがお気に入りです。'
  users[4].posts.create!(
    image: image,
    caption: caption,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

26.upto(30) do |n|
  image = open("#{Rails.root}/db/fixtures/room6.png")
  caption = 'これが私の部屋です。照明がお気に入りです。'
  users[5].posts.create!(
    image: image,
    caption: caption,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

31.upto(35) do |n|
  image = open("#{Rails.root}/db/fixtures/room7.png")
  caption = 'これが私の部屋です。観葉植物がお気に入りです。'
  users[6].posts.create!(
    image: image,
    caption: caption,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

36.upto(40) do |n|
  image = open("#{Rails.root}/db/fixtures/room8.png")
  caption = 'これが私の部屋です。ベッドがお気に入りです。'
  users[7].posts.create!(
    image: image,
    caption: caption,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

41.upto(45) do |n|
  image = open("#{Rails.root}/db/fixtures/room9.png")
  caption = 'これが私の部屋です。コタツがお気に入りです。'
  users[8].posts.create!(
    image: image,
    caption: caption,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

46.upto(50) do |n|
  image = open("#{Rails.root}/db/fixtures/room10.png")
  caption = 'これが私の部屋です。棚がお気に入りです。'
  users[9].posts.create!(
    image: image,
    caption: caption,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..30]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
