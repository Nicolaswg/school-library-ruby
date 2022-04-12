require_relative './json_handler'

class Rental
  include JsonHandler
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self

    @args = [@date, @book, @person]
  end
end
