def create_teacher
  id = Random.rand(1...100)
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Specialization '
  specialization = gets.chomp
  teacher = Teacher.new(id, age, specialization, name)
  @teachers << teacher
  puts 'Teacher created successfully'
end
