require "rails_helper"

describe "POST users", type: :request do
  let(:params) do
    { user: { email: "joh.wick@test.dev", password: "Password12345" } }
  end
  let(:path) { "/users" }

  it "creates a user" do
    expect {
      post path, params: params, as: :json
    }.to change(User, :count).by(+1)

    expect(response).to have_http_status(:success)
    expect(json).to include(message: "User successfully created.")
    expect(json[:user]).to include(email: params[:user][:email])
  end

  it "returns error messages if persisting fails" do
    params[:user][:email] = ""
    params[:user][:password] = ""

    post path, params: params, as: :json

    expect(response).to have_http_status(:unprocessable_entity)
    expect(json).to include(message: "Something went wrong.")
    expect(json[:errors][:email]).to include("can't be blank", "is invalid")
    expect(json[:errors][:password]).to include("can't be blank")
  end
end
