require_relative './json_handler'
 
class Nameable < JsonHandler
  def initialize
    'init'
  end

  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
