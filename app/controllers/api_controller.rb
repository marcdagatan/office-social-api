class ApiController < ApplicationController
  PER_PAGE = 30

  before_action :authenticate_user!
end
