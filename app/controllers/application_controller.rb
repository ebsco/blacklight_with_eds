class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 
  before_filter :authenticate_user!

   include Blacklight::Controller
  # Please be sure to impelement current_user and user_session. Blacklight depends on 
  # these methods in order to perform user specific actions. 

  layout 'blacklight'

  protect_from_forgery
end
