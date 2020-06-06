
user_data = [
  { email: 'admin@test.com', is_admin: true },
  { email: 'user1@test.com' },
  { email: 'user2@test.com' }
]
password = 'test1234'
user_data.each do |user|
  user[:password] = password
  User.create(user)
end
