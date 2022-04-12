require_relative './person'

class Teacher < Person
  def initialize(id, age, specialization, name = 'Unknown')
    super(id, age, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'arguments'             => [ @id, @age, @name, @specialization]
    }.to_json(*args)
  end
end
