def people_list_menu(arr_s, arr_t)
  puts 'Do you want to list students? (1) or a teacher? (2) [Input the number]:'
  people_option = gets.chomp
  case people_option
  when '1'
    if arr_s.empty?
      puts 'No student added'
    else
      arr_s.each { |student| puts "[Students] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}" }
    end
  when '2'
    if arr_t.empty?
      puts 'No teacher added'
    else
      arr_t.each { |teacher| puts "[Teachers] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}" }
    end
  end
end
