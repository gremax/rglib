module Rglib
  class Order
    attr_reader :book, :reader

    def initialize(book, reader)
      @book, @reader = book, reader
      @date = Time.now
    end

    def date
      @date.strftime("%Y-%m-%d at %H:%M")
    end

    def to_s
      "\"#{@book.title}\" ordered by #{@reader.name}. Date: #{self.date}."
    end
  end
end