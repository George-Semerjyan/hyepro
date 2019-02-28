require 'random_data'
 # Create Users
 
 1.times do
   user = User.create(
   :email => 'admin@admin.com',
   :password => 'password',
   :password_confirmation => 'password',
   :admin => true
   )
   user.save!
 end

 # Create Posts
 0.times do
   Post.create!(
     user:   User.find(1),
     strain_name: RandomData.random_word,
     image: File.open('app/assets/images/1.jpg'),
     description: RandomData.random_paragraph,
     price: RandomData.random_price,
     category: RandomData.random_category,
     contact_name: RandomData.random_word,
     phone: 1234567890,
     email: "test@test.com",
     city: RandomData.random_word,
   )
 end
 
 posts = Post.all
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
