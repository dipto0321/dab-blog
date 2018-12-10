class UsersController < ApplicationController
  before_action :user_find, except: %i[index new create]
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :username, :email, :password, :password_confirmation)
  end

  def user_find
    @user = User.find_by(id: params[:id])
  end
end
