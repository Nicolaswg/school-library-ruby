def create_student
  id = Random.rand(1...100)
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Has Parent Permission? [Y/N]: '
  permission = gets.chomp.upcase
  case permission
  when 'Y'
    permission = true
  when 'N'
    permission = false
  end
  student = Student.new(id, age, nil, name, parent_permission: permission)
  @students << student
  puts 'Student created successfully'
end
