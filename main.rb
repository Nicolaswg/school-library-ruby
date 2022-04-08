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

  def book_menu
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

	def list_books
		@books.each_with_index { |book, index| puts "#{index}-) Title: \"#{book.title}\" , Author: #{book.author}" }
		puts ''
	end

	def rental_id_menu(option)
		case option
		when '1'
			print 'Type student ID: '
			id = gets.chomp.to_i
			@students.each {|person| if person.id == id 
				person.rentals.each do |rental|
					puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
				end
			end
			}
		when '2'
			print 'Type teacher ID: '
			id = gets.chomp.to_i
			@teachers.each {|person| if person.id == id 
				person.rentals.each do |rental|
					puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
				end
			end
			}
		end
	end

	def rental_by_id
		puts 'List student rentals (1) or a teacher rentals (2) [Input the number]:'
    people_option = gets.chomp
		rental_id_menu(people_option)
	end

  def list_option(option)
    case option
    when '1'
      if @books.empty?
        puts 'No book added'
      else
      list_books()  
      end
    when '2'
      people_list_menu()
		when '6'
			rental_by_id()
    end
  end

  def create_option(option)
    case option
    when '3'
      people_menu
    when '4'
      book_menu
    when '5'
      rental_menu
    end
  end

  def menu_options(option)
    case option
    when '1', '2', '6'
      list_option(option)
    when '3', '4', '5'
      create_option(option)
    when '7'
      puts 'Exit'
    end
  end

	def rental_check(option)
		case option
		when 1
			puts "select a student from the following list by number [not id]"
			@students.each_with_index {|student, index| puts "#{index}-) Name: \"#{student.name}\" , Age: #{student.age}"}
			@index_s = gets.chomp.to_i

		when 2
			puts "select a teacher from the following list by number [not id]"
			@teachers.each_with_index {|teacher, index| puts "#{index}-) Name: \"#{teacher.name}\" , Age: #{teacher.age}"}
			@index_t = gets.chomp.to_i
		end
	end

	def rental_menu
    puts "Select a book by it's starting number of the list"
		list_books()
		book_index = gets.chomp.to_i
		puts "How is creating the rental? student(1) or teacher(2)"
		rental_checker = gets.chomp.to_i
		rental_check(rental_checker)
		print "Date format [year/month/day] "
		date = gets.chomp
		
		case rental_checker
			when 1
			rental = Rental.new(date, @books[book_index], @students[@index_s])
			when 2
			rental = Rental.new(date, @books[book_index], @teachers[@index_t])
			else
				puts "Invalid option"
		end
		puts 'Rental created succesfully'
  end

  def run
    option = nil
    while option != '7'
      menu_template
      option = gets.chomp
      menu_options(option)
    end
  end
end

app = App.new
app.run
