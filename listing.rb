class Listing


	def list_books(arr)
    arr.each_with_index { |book, index| puts "#{index}-) Title: \"#{book.title}\" , Author: #{book.author}" }
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
end