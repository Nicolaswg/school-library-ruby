require 'json'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

module JsonLoader
  def load_json(path)
		return [] unless File.exist?(path)
		read_path = File.read(path)
		json = JSON.parse(read_path, create_additions: true)
		json
  end
end
