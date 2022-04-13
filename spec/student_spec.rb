require_relative '../student'

describe Student do
  before(:all) do
    @student = Student.new(1, 20, 'classroom')
  end
  context 'Creating a student ' do
    it 'Should have classroom' do
      classroom = @student.classroom
      expect(classroom).to eq 'classroom'
    end
    it '#new' do
      expect(@student).to be_instance_of Student
      expect(@student).to be_a_kind_of Person
    end
  end

  context 'Student methods' do
    it 'Should play hooky' do
      play_hooky = @student.play_hooky
      expect(play_hooky).to eql "¯\(ツ)/¯"
    end

    it 'Should change classroom' do
      classroom = double('classroom')
      allow(classroom).to receive(:students) { [] }
      @student.classroom = classroom
      expect(@student.classroom).to eql classroom
    end
  end

  context 'Creating Rentals' do
    it 'Should add one rental' do
      book = double('book')

      allow(book).to receive(:rentals) { [] }

      @student.create_rental('2015/05/05', book)

      expect(@student.rentals.length).to eq 1
    end
  end
end
