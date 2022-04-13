require_relative '../book'

describe Book do
  context 'Creating a book' do
    before(:all) do
      @book = Book.new('Narnia', 'Aslong')
    end

    it '#new' do
      expect(@book).to be_instance_of Book
    end

    it 'should have initial variables' do
      title = @book.title
      author = @book.author
      expect(title).to eql 'Narnia'
      expect(author).to eql 'Aslong'
    end
  end

  context 'Creating a rental' do
    before(:all) do
      @book = Book.new('Game of Thrones', 'WhiteWalker')
    end

    it 'should add rental' do
      person = double('person')
      allow(person).to receive(:rentals) { [] }

      @book.create_rental('2022/03/03', person)
      expect(@book.rentals.length).to eql 1
    end
  end
end
