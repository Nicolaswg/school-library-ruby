require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'
require_relative './menu_template'
require_relative './create_people'
require_relative './people_list_menu'


class App
  def initialize
    @students = []
    @teachers = []
    @books = []
		@create = Create.new
  end

  def create_people
		puts 'Do you want to create a student (1) or a teacher (2) [Input the number]:'
    option = gets.chomp

    case option
    when '1'
			@students << @create.create_student
    when '2'
      @teachers << @create.create_teacher
    else
      puts 'Invalid option'
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

  def loop_rental(arr)
    print 'Type ID: '
    id = gets.chomp.to_i
    arr.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def rental_id_menu(option)
    case option
    when '1'
      loop_rental(@students)
    when '2'
      loop_rental(@teachers)
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
        list_books
      end
    when '2'
      people_list_menu(@students, @teachers)
    when '6'
      rental_by_id
    end
  end

  def create_option(option)
    case option
    when '3'
      create_people
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

  def select_person_rentals(string, arr)
    puts "select a #{string} from the following list by number [not id]"
    arr.each_with_index { |item, index| puts "#{index}-) Name: \"#{item.name}\" , Age: #{item.age}" }
  end

  def rental_check(option)
    case option
    when 1
      select_person_rentals('student', @students)
    when 2
      select_person_rentals('teacher', @teachers)
    end
  end

  def rental_menu
    puts "Select a book by it's starting number of the list"
    list_books
    book_index = gets.chomp.to_i
    puts 'How is creating the rental? student(1) or teacher(2)'
    rental_checker = gets.chomp.to_i
    rental_check(rental_checker)
    index = gets.chomp.to_i
    print 'Date format [year/month/day] '
    date = gets.chomp

    case rental_checker
    when 1
      Rental.new(date, @books[book_index], @students[index])
    when 2
      Rental.new(date, @books[book_index], @teachers[index])
    else
      puts 'Invalid option'
    end
    puts 'Rental created succesfully'
  end
end
