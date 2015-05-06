require "rglib/version"
require "rglib/author"
require "rglib/book"
require "rglib/order"
require "rglib/reader"

module Rglib
  class Library
    attr_reader :books, :orders, :readers, :authors

    def initialize(authors = [], books = [], readers = [], orders = [])
      @authors, @books, @readers, @orders = authors, books, readers, orders
    end

    def << (data)
      case 
      when data.is_a?(Book)   then @books.push(data)
      when data.is_a?(Order)  then @orders.push(data) 
      when data.is_a?(Reader) then @readers.push(data) 
      when data.is_a?(Author) then @authors.push(data)
      end
    end

    def who_often_takes_the_book book
      orders = self.orders.select { |order| order.book == book }
      readers = orders.map { |order| order.reader }
      readers = readers.inject(Hash.new{0}) { |mem, var| mem[var] +=1; mem }
      readers.max_by { |key, value| value }
    end

    def most_popular_book
      books = self.orders.map { |order| order.book }
      books = books.inject(Hash.new{0}) { |mem, var| mem[var] +=1; mem }
      books.max_by { |key, value| value }[0]
    end

    def how_many_people_ordered_one_of_the_three_most_popular_books
      books = self.orders.map { |order| order.book }
      books = books.inject(Hash.new{0}) { |mem, var| mem[var] +=1; mem }
      books.sort_by { |key, value| value }.reverse[0..2]
    end

    def save(file = 'library.db')
      dump = Marshal.dump(self)
      if File.write(file, dump)
        p "The Library data successfully saved."
      else
        p "We have some errors."
      end
    end

    def self.load(file = 'library.db')
      if File.exists?(file)
        p "Loading from #{file}. Done."
        Marshal.load(File.open(file))
      else
        p "#{file} not found. Creating the new library. Done."
        self.new
      end
    end
  end
end
