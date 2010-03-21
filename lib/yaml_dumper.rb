=begin

Author::  Charles Strahan
License:: public domain

=end

require 'yaml'

# This is a utility class for ripping content from *.rxdata files.
# It's designed to dump large data files without crashing the game engine.
class YAMLDumper
  def self.dump(obj, file)
    # Keep the game from crashing due to "hanging script"
    Graphics.update
    count = 0

    # Dumping one item at a time helps prevent the game from timing out
    Array(obj).each do |e|
      YAML.dump(e, file)

      # Keep the game from crashing due to "hanging script"
      count += 1
      if count % 2 == 0
        Graphics.update
        count = 0
      end
    end
  end
end