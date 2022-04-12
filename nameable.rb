require_relative './json_interface'

class Nameable < JsonInterface
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
