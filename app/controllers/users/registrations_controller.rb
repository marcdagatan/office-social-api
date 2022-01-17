module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?

      register_failed
    end

    def register_success
      render json: { user: UserBlueprint.render_as_hash(resource), message: "User successfully created." }
    end

    def register_failed
      render json: { errors: resource.errors, message: "Something went wrong." }, status: :unprocessable_entity
    end
  end
end
