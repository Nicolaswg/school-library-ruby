require_relative './person'

class Teacher < Person
  def initialize(id, age, specialization, name = 'Unknown')
    super(id, age, name, parent_permission: true)
    @specialization = specialization
    @args = [@id, @age, @specialization, @name ]
  end

  def can_use_services?
    true
  end
end
