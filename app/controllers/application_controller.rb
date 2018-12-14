class ApplicationController < ActionController::Base
  #include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  include Pundit
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    error_message = 'You are not authorized to perform this action.'
    render json: { error: error_message }, status: :forbidden
  end
end
