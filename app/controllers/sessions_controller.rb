class SessionsController < ApplicationController
  def create
    @user = User.find_by(email_params)
    message = if @user && @user.authenticate(params[:password])
                @user.update_columns(auth_token: SecureRandom.hex)
                { auth_token: @user.auth_token, status: 200 }
              else
                { message: 'Invalid email/password', status: 404 }
              end
    render json: message
  end

  def destroy
    @user = current_user
    message = if @user
                @user.update_columns(auth_token: nil)
                { message: 'You logged out!', status: 200 }
              else
                { message: 'Invalid user!', status: 404 }
              end
    render json: message
  end

  private

  def email_params
    params.permit(:email)
  end
end
