require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'

class App
  def initialize
    @students = []
    @teachers = []
    @books = []
    @id = Random.rand(1...100)
		@index_s = nil
		@index_t = nil
  end

  def menu_template
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given id [list all persons firts]'
    puts '7 - Exit'
  end

  def create_student
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
		@id = Random.rand(1...100)
    student = Student.new(@id, age, nil, name, parent_permission: permission)
    @students << student
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization '
    specialization = gets.chomp
		@id = Random.rand(1...100)
    teacher = Teacher.new(@id, age, specialization, name)
    @teachers << teacher
    puts 'Teacher created successfully'
  end

  def create_people(option)
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
    end
  end

  def people_menu
    puts 'Do you want to create a student (1) or a teacher (2) [Input the number]:'
    people_option = gets.chomp
    create_people(people_option)
  end

  def people_list_menu
    puts 'Do you want to list students? (1) or a teacher? (2) [Input the number]:'
    people_option = gets.chomp
    case people_option
    when '1'
      if @students.empty?
        puts 'No student added'
      else
        @students.each { |student| puts "[Students] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}" }
      end
		when '2'
			if @teachers.empty?
        puts 'No teacher added'
      else
        @teachers.each { |teacher| puts "[Teachers] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}" }
			end
    end
  end

  
end

app = App.new
app.run
