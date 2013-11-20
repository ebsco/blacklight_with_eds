class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 
   include Blacklight::Controller
  # Please be sure to impelement current_user and user_session. Blacklight depends on 
  # these methods in order to perform user specific actions. 
  def after_sign_in_path_for(resource)
    if session[:session_key].present?
      connection = EDSApi::ConnectionHandler.new(2)
      connection.end_session(session[:session_key])
      session[:session_key] = nil
    end
    if session[:results].present?
      session[:results] = nil
    end
    if session[:current_url].present?
      session[:current_url]
    end
  end
  
  def after_sign_out_path_for(resource)
    if session[:session_key].present?
      connection = EDSApi::ConnectionHandler.new(2)
      connection.end_session(session[:session_key])
      session[:session_key] = nil
    end
    if session[:results].present?
      session[:results] = nil
    end
    root_path
  end
  
  layout 'blacklight'

  protect_from_forgery
end
