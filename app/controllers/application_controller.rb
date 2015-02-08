class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #rescue_from CanCan::AccessDenied do |exception|
    #flash[:error] = message
    #redirect_to redirect_path
  #end

  ##Can-Can fix for Strong parameters in rails 4
  #before_filter do
    #resource = controller_path.singularize.gsub('/', '_').to_sym
    #method = "#{resource}_params"
    #params[resource] &&= send(method) if respond_to?(method, true)
  #end
end
