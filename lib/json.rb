require 'json/common'
module JSON
  require 'json/version'

  # Can't do this, because RMXP blows up on require 'json/ext'
  #begin
  #  require 'json/ext'
  #rescue LoadError
  #  require 'json/pure'
  #end
  
  require 'json/pure'
  
end
