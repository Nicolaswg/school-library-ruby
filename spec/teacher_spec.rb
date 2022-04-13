require_relative '../teacher'

describe Teacher do
  before :all do 
    @teacher = Teacher.new(23,23,'Time Travel', 'John Titor')
  end
  
  context 'Create Teacher' do 
    it '#new' do 
      expect(@teacher).to be_an_instance_of Teacher
      expect(@teacher).to be_a_kind_of Person
    end
    it 'Should have attributes' do 
      name = @teacher.name
      id = @teacher.id
      age = @teacher.age

      expect(name).to eql 'John Titor'
      expect(id).to eql 23
      expect(age).to eql 23
    end
  end

  context 'Teacher methods' do 
    it 'Can always use services' do 
      services = @teacher.can_use_services?

      expect(services).to be_truthy
    end
  end
  
  context 'Creating Rentals' do 
    it 'Should add one rental' do 
      book = double('book')

      allow(book).to receive(:rentals) {[]}

      @teacher.create_rental('2015/05/05', book)

      expect(@teacher.rentals.length).to eq 1
    end
  end
end
