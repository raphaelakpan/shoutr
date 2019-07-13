class UsersController < Clearance::UsersController
  private

  def user_params
    return Hash.new if params[:action] == 'new'
    params.require(:user).permit(:username, :email, :password)
  end
end
