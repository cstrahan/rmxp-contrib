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
    
    if defined? obj.each
      file.write("---\n")
      
      obj.each do |e|
        yaml = YAML.dump(e)
        
        # Keep the game from crashing due to "hanging script"
        count += 1
        if count % 2 == 0
          Graphics.update
          count = 0
        end
        
        yaml.each do |line|
          if line[0..2] == "---"
            file.write(line[2..-1])
          else
            file.write("  " + line)
          end
        end
      end
    else
      yaml = YAML.dump(obj, file)
    end
  end
end