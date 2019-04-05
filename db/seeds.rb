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
 1.times do
   Post.create!(
     strain_name: "Blue Dream",
     description: "Blue Dream, a sativa-dominant hybrid originating in California, has achieved legendary status among West Coast strains. Crossing a Blueberry indica with the sativa Haze, Blue Dream balances full-body relaxation with gentle cerebral invigoration.",
     category: "Sativa/Hybrid",
     city: "LA",
     phone: 1234567890,
     email: "test@test.com",
     price: 1600,
     contact_name: "John",
     user_id:   1
     )
 end
 
 posts = Post.all
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"