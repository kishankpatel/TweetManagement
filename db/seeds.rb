
user_data = [
  { email: 'admin@test.com', is_admin: true },
  { email: 'user1@test.com' },
  { email: 'user2@test.com' }
]
password = 'test1234'
user_data.each do |user| 
  User.create(email: user[:email], password: password, is_admin: user[:is_admin])
end
