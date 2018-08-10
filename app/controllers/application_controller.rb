class ApplicationController < ActionController::Base
  rescue_from ::CanCan::AccessDenied do |exception|
    Rails.logger.info "Access denied on #{exception.action} #{exception.subject.inspect}"

    respond_to do |format|
      format.html { redirect_to main_app.new_user_session_path, alert: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
      format.json { head :forbidden, content_type: 'text/html' }
    end
  end
end
