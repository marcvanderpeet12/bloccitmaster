require 'faker'

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.save!
end
users = User.all

10.times do
  Topic.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
    )
end
topics = Topic.all

10.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end

posts = Post.all

20.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

#Eigen user om mee in te loggen
admin = User.new(
  name: 'Admin user',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.save

moderator = User.new(
  name: 'Moderate user',
  email: 'moderator@example.com',
  password: 'helloworld',
  role: 'moderator'
  )
moderator.save

member = User.new(
  name: 'Member user',
  email: 'member@example.com',
  password: 'helloworld'
  )
member.save

puts "seed finished!"
# Dit seeds kan ik gebruken als ik wl stoeiten met authorize
# Post.create!(title: "This is the first post", body: "And this is the body")
# Post.create!(title: "This is the second post", body: "And this is the body")