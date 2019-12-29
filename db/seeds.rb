# 管理ユーザー作成
admin = User.create!(user_name: "admin",
                     email: "admin@example.com",
                     password:              "123456",
                     password_confirmation: "123456",
                     confirmed_at: Time.zone.now,
                     confirmation_sent_at: Time.zone.now,
                     admin: true)