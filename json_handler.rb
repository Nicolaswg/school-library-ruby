require 'json'

module JsonHandler
  def write_json(path, arr)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.open(path, 'w') do |file|
      json = JSON.generate(arr, opts)
      file.write(json)
    end
  end

	def self.json_create(object)
    new(*object['arguments'])
  end
	
end