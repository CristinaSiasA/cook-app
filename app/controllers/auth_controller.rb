class AuthController < ApplicationController
  def login
  end

  def register
    @user = User.new
  end

  def store_login
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_recipes_path
    else
      flash.now[:alert] = 'Invalid email or password'
      render :login
    end

  end

  def store_register
    @user = User.new(register_params)
    if @user.save
      redirect_to root_path, notice: 'Account created, please check your email for the code'
    else
      render :register
    end
  end

  private
  def register_params
    params.permit(:name, :email, :password, :password_confirmation,)
  end
end
