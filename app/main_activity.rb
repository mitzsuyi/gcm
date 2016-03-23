class MainActivity < Android::App::Activity
    include Gcm

  def onCreate(savedInstanceState)
    super
    init_gcm
  end
   def onResume 
    super 
    register_gcm_receiver
  end  
  def onPause
    super
    unregister_gcm_receiver 
  end  
end
