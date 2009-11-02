class Persona
    
  attr_accessor :name, :username
  
  def initialize(hash)
    self.name= hash[:name]
    self.username= hash[:username]
  end
  
end

class TwitterPersona < Persona
  require 'rubygems'
  require 'twitter'
  
  attr_accessor :tmp
  
  def get(password)
    httpauth= Twitter::HTTPAuth.new(username, password)
    self.tmp= Twitter::Base.new(httpauth)
  end
  
  def update(new_status)
    self.tmp.update(new_status)
  end
  
  def friends
    self.tmp.friends.map do |f|
      TwitterPersona.new(:name=>f.name, :username=>f.screen_name)
    end
  end
  
end

class FacebookPersona < Persona
  # require 'openfacebook'
  # facebook API
end