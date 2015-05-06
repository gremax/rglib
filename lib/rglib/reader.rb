module Rglib
  class Reader
    attr_reader :name, :email, :city, :street, :house

    def initialize(name, opts = {})
      @name = name
      @email, @city, @street, @house = opts[:email],  opts[:city], 
                                       opts[:street], opts[:house]
    end
    
    def to_s
      string = "#{@name}"
      string += " from #{@city}" unless @city.nil?
      string += " <#{@email}>" unless @email.nil?
      string
    end
  end
end