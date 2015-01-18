require 'faker'
 
5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10),
   )
   user.save!
 end
 users = User.all

 15.times do
   Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all


 # Create Posts
 50.times do
    post = Post.create!(
     user: users.sample,
     topic:  topics.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )

       post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
       post.update_rank

 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     user: users.sample,
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

admin = User.new(
   name:     'Admin User',
   email:    'admin3@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator3@example.com', 
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member3@example.com',
   password: 'helloworld'
 )
 member.save!


 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"