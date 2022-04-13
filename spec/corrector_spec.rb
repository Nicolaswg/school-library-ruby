require_relative '../nameable'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

class Name < Nameable
  def initialize(name)
    super()
    @name = name
  end

  def correct_name
    @name
  end
end

describe CapitalizeDecorator do
  context 'Capitalize Name' do
    it 'Should Capitalize Name' do
      name = Name.new('john')
      name = CapitalizeDecorator.new(name)

      corrected_name = name.correct_name

      expect(corrected_name).to eq 'John'
    end
  end
end

describe TrimmerDecorator do
  context 'Trim name' do
    it 'Should Trim Name' do
      name = Name.new('john titor third king of england')
      name = TrimmerDecorator.new(name)

      corrected_name = name.correct_name

      expect(corrected_name).to eq 'john titor'
    end
  end
end

describe 'Chained Decorators' do
  context 'Use Capitalize and Trim decorators' do
    it 'Should Capitalize and Trim name' do
      name = Name.new('john titor third king of england')
      name = TrimmerDecorator.new(name)
      name = CapitalizeDecorator.new(name)

      corrected_name = name.correct_name

      expect(corrected_name).to eq 'John titor'
    end
  end
end
