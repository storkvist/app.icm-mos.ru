class ApplicationController < ActionController::Base
  default_form_builder IcmFormBuilder

  rescue_from ::CanCan::AccessDenied do |exception|
    Rails.logger.info "Access denied on #{exception.action} #{exception.subject.inspect}"

    respond_to do |format|
      format.html do
        redirect_to (user_signed_in? ? main_app.home_path : main_app.new_user_session_path), alert: exception.message
      end

      format.js   { head :forbidden, content_type: 'text/html' }
      format.json { head :forbidden, content_type: 'text/html' }
    end
  end
end
