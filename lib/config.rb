class Config 
  def self.init properties 
    @properties = properties
  end 
  def self.api_url 
    @properties.getProperty("api.url")
  end   
  def self.sender_id
     @properties.getProperty("sender_id")
  end   
end   