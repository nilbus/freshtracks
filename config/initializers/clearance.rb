require './lib/clearance/authentication'
Clearance.configure do |config|
  config.mailer_sender = 'donotreply@example.com'
  config.class_eval 'attr_accessor :access_denied_path' # create a custom configuration variable
  config.access_denied_path = '/'
end
