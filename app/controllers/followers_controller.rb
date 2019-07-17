class FollowersController < ApplicationController
  before_action :set_user

  def index
    @followers = @user.followers
  end

  private

  def set_user
    @user = User.find_by(username: params[:user_id])
  end
end
