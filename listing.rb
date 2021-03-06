class Listing
  # Type Book
  def list_books(arr)
    arr.each_with_index { |book, index| puts "#{index}-) Title: \"#{book.title}\" , Author: #{book.author}" }
    puts ''
  end

  # Type People
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

  def empty_message
    puts 'No people found matching requested type'
    nil
  end

  # Type Student, Type Teacher
  def people_list_menu(students, teachers)
    puts 'Do you want to list students? (1) or a teacher? (2) [Input the number]:'
    people_option = gets.chomp
    case people_option
    when '1'
      return empty_message if students.empty?

      students.each_with_index do |student, index|
        puts "#{index}-) [Students] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}"
      end
    when '2'
      return empty_message if teachers.empty?

      teachers.each_with_index do |teacher, index|
        puts "#{index}-) [Teachers] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}"
      end
    end
    people_option.to_i
  end
end
