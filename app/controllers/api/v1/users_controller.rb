class Api::V1::UsersController < Api::V1::BaseController
  
  before_action :authenticate_api_user, only: :logout 
  
  def login
    email, password = params[:email], params[:password]
    return error_response("Email should not be blank") unless email

    @user = User.where(email: email).first
    return error_response("User not found") unless @user
    @user.save! unless @user.authentication_token

    if @user.valid_password?(password)
      sign_in(@user)
      render json: @user
    else
      error_response("Invalid password")
    end
  end

  def logout
    @user.update_column(:authentication_token, nil)
    sign_out(@user)
    render json: { success: true, info: 'Logged out'}.to_json, status: :ok
  end

end
