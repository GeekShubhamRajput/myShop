class Api::V1::BaseController < ActionController::Base
  include Response

  protected

    def authenticate_api_user
      @user ||= User.find_by(authentication_token: user_auth_token) if user_auth_token
      @user || error_response('Invalid authentication token')
    end

    def user_auth_token
      request.headers['Authorization'] if request.headers['Authorization'].present?
    end

end

