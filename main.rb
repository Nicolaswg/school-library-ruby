require 'fileutils'
require_relative './app'
require_relative './menu_template'

def main
  unless Dir.exists?('rentals')
    FileUtils.mkdir_p('rentals/Student')
    FileUtils.mkdir_p('rentals/Teacher')
  end
  app = App.new
  option = nil
  while option != '7'
    menu_template
    option = gets.chomp
    app.menu_options(option)
  end
end

main
