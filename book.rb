require_relative './rental'
require_relative './json_handler'

class Book
  include JsonHandler
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
