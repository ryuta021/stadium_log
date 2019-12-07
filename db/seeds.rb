# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create!(
   email: 'test@test.com',
   password: '111111',
   team_id: 1,
   name: 'テスト太郎',
)


Admin_user.create!(
   email: 'admin@test.com',
   password: '888888',
)
