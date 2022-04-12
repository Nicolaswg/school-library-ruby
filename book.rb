require_relative './rental'
require_relative './json_interface'

class Book < JsonInterface
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @args = [@title, @author]
    @rentals = []
  end

  def create_rental(date, person)
    Rental.new(date, self, person)
  end
end
