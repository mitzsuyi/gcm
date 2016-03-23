  class GcmIdListenerService < Com::Google::Android::Gms::Iid::InstanceIDListenerService
     def onTokenRefresh
      raise "refresh@@@@@@@"
      intent = Android::Content::Intent.new self, Gcm::GcmRegistrationIntentService.class
      startService intent   
     end  
  end    
