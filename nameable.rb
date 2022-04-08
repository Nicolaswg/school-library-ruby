class Nameable
  def initialize
    'init'
  end

  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
