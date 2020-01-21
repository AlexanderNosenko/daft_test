class BaseController < ActionController::API

  include Authorizable
  include ResponseHandler

end
