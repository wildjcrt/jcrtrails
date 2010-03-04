# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  # 
  # 
  def require_is_admin
    if current_user 
      unless current_user.is_admin
        redirect_back_or_default("/")
      end
    end
  end
end
