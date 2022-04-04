require_relative './person'

class Teacher < Person
  def initialize(name = "Unknown", age, specialization, parent_permission: true)
    super(name,age,parent_permission)
    @id = Random.rand(1..100)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
