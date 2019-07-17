class UsersController < Clearance::UsersController
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    @shouts = @user.shouts
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find_by(username: params[:id])
  end
end
