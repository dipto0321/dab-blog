class UsersController < ApplicationController
  before_action :user_find
  before_action :authenticate_user!
  def index
  end

  def show
  end

  private

  def user_find
    @user = User.find_by(id: params[:id])
  end
end
