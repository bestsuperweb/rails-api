# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(email: 'browe@myhome.com', password: 'password', name:'br', bio: 'Something about me.')
u2 = User.create(email: 'browe2@myhome.com', password: 'password', name:'br', bio: 'more Something about me.')

p1 = u1.posts.create(body: 'a title post')
p2 = u1.posts.create(body: 'a second title post')
p3 = u1.posts.create(body: 'a third title post')
p4 = u1.posts.create(body: 'a fourth title post')

p3.comments.create(body: "this post is terrible", user: u1)
p4.comments.create(body: "love it!", user: u1)
