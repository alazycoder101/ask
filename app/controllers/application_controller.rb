class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  protected

  def render_404
    render(file: 'public/404.html', :layout => false, status: :not_found)
  end

  def user_not_authorized(exception)
   policy_name = exception.policy.class.to_s.underscore

   flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
   redirect_back(fallback_url: root_path)
 end
end
