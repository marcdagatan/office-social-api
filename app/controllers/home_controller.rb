class HomeController < ApplicationController
  def index
    render json: { message: "Hello." }, status: :ok
  end
end
