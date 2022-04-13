require_relative '../person'

describe Person do
  def create_unknow
    Person.new(12, 15)
  end

  def create_marco
    Person.new(12, 15, 'Marco')
  end

  def create_marco_no_permission
    Person.new(12, 15, 'Marco', parent_permission: false)
  end

  def create_marco_older
    Person.new(12, 25, 'Marco', parent_permission: false)
  end

  context 'Creating person instance' do
    it '#new' do
      person = create_unknow

      expect(person).to be_instance_of(Person)
      expect(person).to be_a_kind_of(Nameable)
    end

    it 'Should have default values' do
      person = create_unknow

      id = person.id
      age = person.age
      name = person.name

      expect(name).to eq 'Unknown'
      expect(id).to eq 12
      expect(age).to eq 15
    end

    it 'Should have personalized name' do
      marco = create_marco

      name = marco.name

      expect(name).to eq 'Marco'
    end
  end

  context 'Can use services?' do
    it 'Should have permission by default' do
      marco = create_marco

      permission = marco.can_use_services?

      expect(permission).to be_truthy
    end

    it 'Should not have permission' do
      marco = create_marco_no_permission

      permission = marco.can_use_services?

      expect(permission).to be_falsey
    end

    it 'Should have permission by age' do
      marco = create_marco_older

      permission = marco.can_use_services?

      expect(permission).to be_truthy
    end
  end

  context 'Correct name' do
    it 'Should return bare name' do
      marco = create_marco

      corrected_name = marco.correct_name

      expect(corrected_name).to eq marco.name
    end
  end

  context 'Creating Rentals' do
    it 'Should add one rental' do
      marco = create_marco
      book = double('book')

      allow(book).to receive(:rentals) { [] }

      marco.create_rental('2015/05/05', book)

      expect(marco.rentals.length).to eq 1
    end
  end
end
