# Rglib

The simple Library gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rglib', :git => "git://github.com/gremax/rglib"
```

And then execute:

    $ bundle

## Usage

```ruby
require 'rglib'

# Library initialize
lib = Rglib::Library.new
# or get all Library data from file
lib = Rglib::Library.load
# or
lib = Rglib::Library.load('filename.db')

# Add authors
lib << Rglib::Author.new("Mark Twain", "biography")
lib << Rglib::Author.new("F. Scott Fitzgerald", "biography")
lib << Rglib::Author.new("George R. R. Martin", "biography")

# Add books
lib << Rglib::Book.new("The Adventures of Tom Sawyer", lib.authors[0])
lib << Rglib::Book.new("The Great Gatsby", lib.authors[1])
lib << Rglib::Book.new("A Game of Thrones", lib.authors[2])

# Add readers
lib << Rglib::Reader.new("Jon Snow", { email: "jon.snow@bastards.org", city: "Winterfell" })
lib << Rglib::Reader.new("Tyrion Lannister", { email: "tyrion@halfman.org",  city: "Casterly Rock" })
lib << Rglib::Reader.new("Arya Stark", { email: "arya@stark.org", city: "Winterfell" })

# Add a new order
lib << Rglib::Order.new(lib.books[0], lib.readers[2])
lib << Rglib::Order.new(lib.books[1], lib.readers[1])
lib << Rglib::Order.new(lib.books[2], lib.readers[0])

# Save all Library data to file
lib.save
# or
lib.save('filename.db')

# Who often takes the book
book = lib.books.first
lib.who_often_takes_the_book(book)

# What is the most popular book
lib.most_popular_book

# How many people ordered one of the three most popular books
lib.how_many_people_ordered_one_of_the_three_most_popular_books.each do |book, count|
  puts "\"#{book.title}\" by #{book.author.name} — #{count} readers."
end
```

## Contributing

1. Fork it ( https://github.com/gremax/rglib/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
