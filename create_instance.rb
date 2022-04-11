require_relative './student'
require_relative './teacher'
require_relative './book'

class Create
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
		puts 'Student created successfully'
		student
	end

	def create_teacher
		id = Random.rand(1...100)
		print 'Age: '
		age = gets.chomp
		print 'Name: '
		name = gets.chomp
		print 'Specialization '
		specialization = gets.chomp
		teacher = Teacher.new(id, age, specialization, name)
		puts 'Teacher created successfully'
		teacher
	end

	def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts 'Book created successfully'
		book
  end
end
