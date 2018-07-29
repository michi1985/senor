class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "アカウントを削除しました。"
    redirect_to users_url
  end
end
