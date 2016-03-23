module Gcm
  LocalBroadcastManager = Android::Support::V4::Content::LocalBroadcastManager
  PLAY_SERVICES_RESOLUTION_REQUEST = 9000
  def init_gcm 
    init_broadcast_receiver
    if checkPlayServices
      intent = Android::Content::Intent.new 
      intent.setClassName self, "GcmRegistrationIntentService"
      startService intent
      p "started registration intent service"
    end 
  end   
  def register_gcm_receiver
    p "registered??? #{ @gcm_receiver_registered}"
    unless @gcm_receiver_registered
      p "local broadcast manager register registration receiver "
      LocalBroadcastManager.getInstance(self).registerReceiver(
        @registration_broadcast_receiver,
        Android::Content::IntentFilter.new(Preferences::REGISTRATION_COMPLETE)
      )
      @gcm_receiver_registered = true
     else 
     p "already registered" 
    end 
  end  
  def unregister_gcm_receiver
    p "local broadcast manager unregister registration receiver "
    LocalBroadcastManager.getInstance(self).unregisterReceiver @registration_broadcast_receiver 
    @gcm_receiver_registered = false 
  end  
  private 
  def init_broadcast_receiver
    @registration_broadcast_receiver = GcmRegistrationBroadcastReceiver.new 
  end 
  def checkPlayServices
    true
  end 
end   