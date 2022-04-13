require_relative '../classroom'

describe ClassRoom do
  before(:all) do
    @classroom = ClassRoom.new('math')
  end

  context 'Classroom methods' do
    it '#new' do
      expect(@classroom).to be_instance_of ClassRoom
    end
    it 'Should have label' do
      label = @classroom.label
      expect(label).to eql 'math'
    end
    it 'Should change label' do
      @classroom.label = 'time travelers'
      expect(@classroom.label).to eql 'time travelers'
    end
    it 'Should add student' do
      student = double('math').as_null_object
      @classroom.add_student(student)
      expect(@classroom.students.length).to eq 1
    end
  end
end
