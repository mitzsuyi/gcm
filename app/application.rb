class Application < Android::App::Application
  def onCreate
    @@instance = self
    API.application_context = self
    properties = Java::Util::Properties.new
    properties.load assets.open("config.properties")
    shared_preferences = Android::Preference::PreferenceManager.getDefaultSharedPreferences(self)
    Preferences.init shared_preferences
    Config.init properties
  end     
end   