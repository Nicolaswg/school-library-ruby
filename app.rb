require_relative './rental'
require_relative './create_instance'
require_relative './listing'
require_relative './json_handler'

class App
  include JsonHandler

  def initialize
    @students = load_json('students.json')
    @teachers = load_json('teachers.json')
    @books = load_json('books.json')
    @create = Create.new
    @listing = Listing.new
    load_rentals(@students)
    load_rentals(@teachers)
  end

  def load_rentals(arr)
    arr.each do |person|
      path = "rentals/#{person.class.name}/#{person.id}.json"
      person.rentals = load_json(path)
    end
  end

  def create_people
    puts 'Do you want to create a student (1) or a teacher (2) [Input the number]:'
    option = gets.chomp

    case option
    when '1'
      @students << @create.create_student
      write_json('students.json', @students)
    when '2'
      @teachers << @create.create_teacher
      write_json('teachers.json', @teachers)
    else
      puts 'Invalid option'
    end
  end

  def rental_id_menu
    puts 'List student rentals (1) or a teacher rentals (2) [Input the number]:'
    option = gets.chomp

    case option
    when '1'
      @listing.loop_rental(@students)
    when '2'
      @listing.loop_rental(@teachers)
    end
  end

  def create_rental(arr, index, book_index, date)
    path = "rentals/#{arr[index].class.name}/#{arr[index].id}.json"
    Rental.new(date, @books[book_index], arr[index])
    write_json(path, arr[index].rentals)
  end

  def rental_menu
    puts "Select a book by it's starting number of the list"
    @listing.list_books(@books)
    book_index = gets.chomp.to_i
    puts 'How is creating the rental?'
    rental_checker = @listing.people_list_menu(@students, @teachers)
    return nil if rental_checker.nil?

    index = gets.chomp.to_i
    print 'Date format [year/month/day] '
    date = gets.chomp

    case rental_checker
    when 1
      create_rental(@students, index, book_index, date)
    when 2
      create_rental(@teachers, index, book_index, date)
    else
      puts 'Invalid option'
    end
    puts 'Rental created succesfully'
  end

  def list_option(option)
    case option
    when '1'
      if @books.empty?
        puts 'No book added'
      else
        @listing.list_books(@books)
      end
    when '2'
      @listing.people_list_menu(@students, @teachers)
    when '6'
      rental_id_menu
    end
  end

  def create_option(option)
    case option
    when '3'
      create_people
    when '4'
      @books << @create.create_book
      write_json('books.json', @books)
    when '5'
      rental_menu
    end
  end

  private :create_option, :list_option, :create_people, :create_rental

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
end
