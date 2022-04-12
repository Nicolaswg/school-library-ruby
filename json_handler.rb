require 'json'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

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

  def load_json(path)
    return [] unless File.exist?(path)

    read_path = File.read(path)
    JSON.parse(read_path, create_additions: true)
  end
end
