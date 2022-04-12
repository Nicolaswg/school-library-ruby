require_relative './app'
require_relative './menu_template'

def main
  Dir.mkdir('rentals') unless Dir.exist?('rentals')
  app = App.new
  option = nil
  while option != '7'
    menu_template
    option = gets.chomp
    app.menu_options(option)
  end
end

main
