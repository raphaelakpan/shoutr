class Timeline
  def initialize(user_ids)
    @user_ids = user_ids
  end

  def shouts
    Shout
      .where(user_id: user_ids)
      .order(created_at: :desc)
      .includes(:content)
  end

  def to_partial_path
    "timelines/timeline"
  end

  private

  attr_reader :user_ids
end
