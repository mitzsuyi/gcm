# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/android'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'gcm'
  app.development { app.archs = ["x86"] unless ARGV.include?("device") || ARGV.include?("archive") }
  app.package = "as.gcm"
  app.manifest_entry('uses-permission', :name => 'com.google.android.providers.gsf.permission.READ_GSERVICES')
  app.files = (app.files + Dir["./lib/**/*.rb"]).flatten

  # Enable the Google Play Services library in the manifest file.
  app.manifest_entry('application', 'meta-data', :name => 'com.google.android.gms.version', :value => '@integer/google_play_services_version')

  # Log messages from the Google Play Services library to the developer console.
  app.logs_components << 'GooglePlayServicesUtil:I'
  app.gradle do
    dependency 'com.google.android.gms:play-services-gcm:8.4.0'
  end 
  app.manifest.child('application') do |application|
     application.add_child('service') do |service|
        service['android:exported'] = -> {"false"}
        service['android:name'] = -> {  "as.gcm.GcmRegistrationIntentService" } 
    end
   end        
end
