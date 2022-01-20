module Api
  class ValidatesController < ApiController
    def show
      render json: { message: "Yep, your token is still valid!" }, status: :ok
    end
  end
end
