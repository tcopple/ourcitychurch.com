class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_path
  end

  def after_sign_in_path_for(user)
    if not user.role.nil?
      return send(user.role.to_s << "_dashboard_path")
    else
      raise "User has no role assigned, please contact administrator."
    end
  end
end
