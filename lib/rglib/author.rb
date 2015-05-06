module Rglib
  class Author
    attr_reader :name, :biography

    def initialize(name, biography = nil)
      @name, @biography = name, biography
    end

    def to_s
      "#{@name}. #{@biography}"
    end   
  end
end