class AuthenticationController < ApplicationController  
  skip_before_action :authorize_request, only: [:authenticate, :authenticate_twitter]
  # return auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  def authenticate_twitter
    @user = User.find_or_create_from_auth_hash(auth_hash)
    auth_token = JsonWebToken.encode(user_id: @user.id)
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end

  protected
 
  def auth_hash
    params.permit(:provider, :uid, :email, :name, :token, :secret )
  end

end