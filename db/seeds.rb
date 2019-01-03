require 'random_data'

 # Create Posts
 50.times do
   Post.create!(
     strain_name: RandomData.random_word, 
     description: RandomData.random_sentence, 
     category: "indica", 
     city: RandomData.random_word,
     phone: RandomData.random_number, 
     email: "test@test.com"
   )
 end
 
 posts = Post.all
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
