class FollowedUsersController < ApplicationController
  before_action :find_user, only: [:create, :destroy]

  def create
    current_user.follow @user
    redirect_to user_path(@user)
  end

  def destroy
    current_user.unfollow @user
    redirect_to user_path(@user)
  end

  private

  def find_user
    @user = User.find_by(username: params[:id])
  end
end
