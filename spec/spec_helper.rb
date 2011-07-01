# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
#require 'spec/autorun' #from rails2, might not be needed
require 'rspec/rails'

require 'authlogic/test_case'
require 'shoulda'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
Dir[Rails.root.join("spec/factories/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
end

class ActionController::TestCase
  setup :activate_authlogic
end


# =============== OLD STUFF ===============
# this stuff is from rails2 (old spec helper), might not be needed

#Helpers for authlogic and rspec
#
#def current_user(stubs = {})
#  @current_user ||= mock_model(User, stubs)
#end
#
#def user_session(stubs = {}, user_stubs = {})
#  @current_user ||= mock_model(UserSession, {:user => current_user(user_stubs)}.merge(stubs))
#end
#
#def login(session_stubs = {}, user_stubs = {})
#  UserSession.stub!(:find).and_return(user_session(session_stubs, user_stubs))
#end
#
#def logout
#  @user_session = nil
#end
