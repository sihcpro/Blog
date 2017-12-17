class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params)
    # @confirm = Confirm.new(token: SecureRandom.urlsafe_base64.to_s)

    message = if @user.save
                { message: 'Create account success!', status: 201 }
              else
                { message: user.errors.full_messages, status: 409 }
              end
    render json: message
  end

  def show
    user = current_user
    if user
      render json: user, serializer: Users::ShowSerializer
    else
      render json: { message: 'Not found user!', status: 404 }
    end
  end

  def update
    user = current_user
    message = if user
                if user.update(user_update_params)
                  { message: 'Update successed!', status: 202 }
                else
                  { message: 'Update failt!', status: 409 }
                end
              else
                { message: 'Not found user!', status: 404 }
              end
    message['errors'] = user.errors.full_messages
    render json: message
  end

  def destroy
    # User.delete(params[:id])
  end

  private

  def user_create_params
    params.permit(:user_name, :email, :gender, :password, :role)
  end

  def user_update_params
    params.permit(:user_name, :email, :gender, :password)
  end
end
