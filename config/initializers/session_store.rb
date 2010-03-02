# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jcrtrails_session',
  :secret      => 'cc0a07c899683a5d78e430ef76e8f2f8cc9b118b8ab87a67441a23193d6504a073b4a29e825a410ff1bd6d1c498f8979eec50251598c977d9dfd2ff18eacbcd9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
