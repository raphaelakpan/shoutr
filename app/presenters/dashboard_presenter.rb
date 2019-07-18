class DashboardPresenter
  def initialize(user)
    @user = user
  end

  def timeline
    Timeline.new(timeline_user_ids)
  end

  private

  attr_reader :user

  def timeline_user_ids
    user.followed_user_ids + [user.id]
  end
end
