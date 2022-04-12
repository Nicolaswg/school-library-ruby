require_relative './rental'
require_relative './json_handler'

class Book
	include JsonHandler
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def create_rental(date, person)
    Rental.new(date, self, person)
  end

	def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'arguments'             => [ @title, @author ]
    }.to_json(*args)
  end
end
