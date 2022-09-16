# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
15.times do
  Author.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                title: Faker::Job.title)
  Supplier.create(name: Faker::Appliance.brand)
end

100.times do
    Customer.create(first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    title: Faker::Job.title,
                    email: Faker::Internet.email,
                    visits: Faker::Number.number(digits: 1),
                    orders_count: Faker::Number.number(digits: 2),
                    lock_version: Faker::Number.number(digits: 1))

    book = Book.create(title: Faker::Job.title,
                       year_published: Faker::Number.number(digits: 1),
                       isbn: Faker::Code.isbn,
                       price: Faker::Number.decimal(l_digits: 2),
                       out_of_print: Faker::Boolean.boolean,
                       views: Faker::Number.number(digits: 6),
                       supplier_id: Faker::Number.within(range: 1..10),
                       author_id: Faker::Number.within(range: 1..10))

    Order.create(date_submited: Time.zone.now - 1.month,
                 status: Faker::Number.within(range: 0..3),
                 subtotal: Faker::Number.decimal(l_digits: 2),
                 shipping: Faker::Number.decimal(l_digits: 2),
                 tax: Faker::Number.number(digits: 1),
                 total: Faker::Number.within(range: 1..100),
                 customer_id: Faker::Number.within(range: 1..100),
                 books: [book])

    Review.create(title: Faker::Job.title,
                  body: Faker::Food.description,
                  rating: Faker::Number.number(digits: 1),
                  state: Faker::Number.within(range: 0..2),
                  customer_id: Faker::Number.within(range: 1..100),
                  book_id: Faker::Number.within(range: 1..100))
end
