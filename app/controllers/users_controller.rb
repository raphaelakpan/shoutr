class UsersController < Clearance::UsersController

  def show
    @user = User.find(params[:id])
    @shouts = @user.shouts
  end

  private

  def user_params
    return Hash.new if params[:action] == 'new'
    params.require(:user).permit(:username, :email, :password)
  end
end
