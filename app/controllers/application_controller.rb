class ApplicationController < ActionController::API
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authorized
    render json: { message: "You are not authorized to perform this action." }, status: :unauthorized
  end
end
