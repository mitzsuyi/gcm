class Preferences
  SENT_TOKEN_TO_SERVER = "SENT_TOKEN_TO_SERVER" 
  REGISTRATION_COMPLETE = "REGISTRATION_COMPLETE"
  class << self 
    attr_accessor :shared
    def init shared 
      self.shared = shared  
    end   
    def sent_token_to_server
      shared.getBoolean SENT_TOKEN_TO_SERVER, false
    end  
    def sent_token_to_server= sent 
      shared.setBoolean SENT_TOKEN_TO_SERVER, sent
    end   
  end 
end     
  