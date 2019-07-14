class ShoutsController < ApplicationController
  def create
    shout = current_user.shouts.create(shouts_params)
    redirect_to root_path, redirect_options_for(shout)
  end

  def show
    @shout = Shout.find(params[:id])
  end

  private

  def shouts_params
    params.require(:shout).permit(:body)
  end

  def redirect_options_for(shout)
    if shout.persisted?
      { notice: 'Shouted successfully' }
    else
      { alert: 'There was an error shouting' }
    end
  end
end
