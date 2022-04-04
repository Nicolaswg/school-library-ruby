class Person
  attr_reader :id
  attr_accessor :name, :age
  
  def initialize(name = "Unknown",age, parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    @age >=18
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end

  private :is_of_age?
end

person1 = Person.new("Nicolas",25)
person2 = Person.new("pedro",15)
