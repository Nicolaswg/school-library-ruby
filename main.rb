require_relative './person'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'

person = Person.new(22, 'maximilianus')
p person.correct_name
capitalize_person = CapitalizeDecorator.new(person)
p capitalize_person.correct_name
capitalize_trimmer_person = TrimmerDecorator.new(capitalize_person)
p capitalize_trimmer_person.correct_name
