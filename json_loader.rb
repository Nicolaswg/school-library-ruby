require 'json'
require_relative './student'

module JsonLoader
  def load_json(path)
    student = Teacher.new(45, 56, 'Marco', 'nsees')
    json = JSON.generate(student)
    puts json
    new_student = JSON.parse(json, create_additions: true)
    puts new_student.name
  end
end
