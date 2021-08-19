# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

11.times do
  Review.create(rating: 5, title: 'test', author_id: 1, gbook_id: 'dhzuIutwYG0C', content: 'tset',
                book_name: 'Percy Jackson and the Last Olympian (Book 5)')
end

11.times do
  Discussion.create(gbook_id: 'dhzuIutwYG0C', book_name: 'Percy Jackson and the Last Olympian (Book 5)', title: 'test',
                    content: 'test', author_id: 1)
end
