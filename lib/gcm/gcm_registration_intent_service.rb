  class GcmRegistrationIntentService < Android::App::IntentService
    LOG = Android::Util::Log
    def initialize name 
      super("GcmRegistrationIntentService")
      LOG.i "intent service initialized"
     end  
    
     def onHandleIntent intent 
      _in = Android::Content::Intent.new(Preferences::REGISTRATION_COMPLETE) 
      _in.action = Preferences::REGISTRATION_COMPLETE
      _in.putString("token", token)
       LOG.i "intent service got token sending out broadcast "
       Java::Lang::Thead.sleep(10000)
       Android::Support::V4::Content::LocalBroadcastManager.getInstance(self).sendBroadcast(_in);
     end  
  end    
