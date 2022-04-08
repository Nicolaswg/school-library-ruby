def create_teacher(id)
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
