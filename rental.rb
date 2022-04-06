class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date

    @book = book
    book.retals << self

    @person = person
    person.retals << self
  end
end
