class DashboardController < ApplicationController
  def show
    @dashboard_presenter = DashboardPresenter.new(current_user)
  end
end
