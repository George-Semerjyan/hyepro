 module RandomData

   def self.random_paragraph
     sentences = []
     rand(2..4).times do
       sentences << random_sentence
     end
 
     sentences.join(" ")
   end
 
   def self.random_sentence
     strings = []
     rand(3..8).times do
       strings << random_word
     end
 
     sentence = strings.join(" ")
     sentence.capitalize << "."
   end
 
   def self.random_word
     letters = ('a'..'z').to_a
     letters.shuffle!
     letters[0,rand(3..8)].join
   end
   
    def self.random_category
     catigories = ["indica", "sativa", "hybrid", "indica/hybrid", "sativa/hybrid"]
     catigories.sample
    end
   
   def self.random_number
     numbers = (0..9).to_a
     numbers.shuffle!
     numbers[0,9].join
   end
   
   def self.random_price
     prices = [1500, 1600, 1700]
     prices.sample
   end
 end