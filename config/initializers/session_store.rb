# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_freshtracks_session',
  :secret      => '157cc623d4f5147cf3582b08a457f33d845a126a2c9916420485fbe7df59af52419b18043d4b7776b313372e9064b5c07ff37c44028d202c89555e26ae49ba4e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
