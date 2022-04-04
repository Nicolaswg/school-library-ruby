require_relative './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @id = Random.rand(1..100)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
