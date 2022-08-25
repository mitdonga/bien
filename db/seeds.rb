# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Review.destroy_all

number_of_reviews_added = 0
# number_of_reviews_added = 0

20.times do 
   review = Review.new(title: Faker::Restaurant.review, body: Faker::Restaurant.description, score: rand(5..10), restaurant: Faker::Restaurant.name , price: rand(10..500), cuisine: Faker::Restaurant.type, phone_number: Faker::PhoneNumber.cell_phone, ambiance: Faker::Restaurant.type, address: Faker::Address.full_address)

   if review.save
      temp = rand(1..5)
      temp.times do 
         comment = review.comments.new(commenter: Faker::Name.name, comment: Faker::Lorem.sentence(word_count: rand(10..20)))
         review.save
      end
   end
   number_of_reviews_added += 1
end

puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #{number_of_reviews_added} Restaurant Reviews added to database"
