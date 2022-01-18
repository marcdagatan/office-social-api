require "rails_helper"

describe "GET /", type: :request do
  it "return a hello" do
    get "/", as: :json

    expect(response).to have_http_status :success
    expect(json).to include(message: "Hello.")
  end
end
