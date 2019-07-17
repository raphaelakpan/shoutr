class DashboardController < ApplicationController
  def show
    @shout = Shout.new
    @shouts = current_user.shouts.includes(:content)
  end
end
