require 'json'
require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, classroom, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
    @classroom = classroom
    @args = [@id, @age, @classroom, @name, @parent_permission]
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def self.json_create(object)
    id, age, classroom, name, parent_permission = *object['arguments']
    new(id, age, classroom, name, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
