require_relative '../rental'

describe Rental do
  context 'Creating rentals' do
    it '#new' do
      book = double('book', rentals: [])
      person = double('person', rentals: [])
      rental = Rental.new('2020/05/05', book, person)

      expect(rental).to be_instance_of Rental
      expect(rental).to be_a_kind_of JsonInterface
    end
  end
end
