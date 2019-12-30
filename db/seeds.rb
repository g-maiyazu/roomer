# ユーザ
user = User.create!(user_name: 'test0',
                    email: 'test0@mail.com',
                    password: 'password',
                    password_confirmation: 'password',
                    confirmed_at: Time.zone.now,
                    confirmation_sent_at: Time.zone.now,
                    admin: false)
user.build_profile
user.save

# その他のユーザ
30.times do |n|
  user_name = "test#{n + 1}"
  email = "test#{n + 1}@mail.com"
  password = 'password'
  admin = false

  other_user = User.create!(user_name: user_name,
                            email: email,
                            password: password,
                            password_confirmation: password,
                            confirmed_at: Time.zone.now,
                            confirmation_sent_at: Time.zone.now,
                            admin: admin)

  other_user.build_profile
  other_user.save
end

# 管理ユーザー
admin_user = User.create!(user_name: 'admin',
                          email: 'admin@mail.com',
                          password: 'password',
                          password_confirmation: 'password',
                          confirmed_at: Time.zone.now,
                          confirmation_sent_at: Time.zone.now,
                          admin: true)

admin_user.build_profile
admin_user.save
