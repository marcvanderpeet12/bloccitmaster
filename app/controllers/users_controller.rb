class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def index
    @users = User.all
    
  end

  def show
    # @topic = Topic.find(params[:id])
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_favorites)
  end
end