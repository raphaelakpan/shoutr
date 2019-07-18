class ShoutSearchQuery
  def initialize(term)
    @term = term
  end

  def to_relation
    Shout
      .joins("LEFT JOIN text_shouts ON shouts.content_type = 'TextShout' AND shouts.content_id = text_shouts.id")
      .where("text_shouts.body LIKE ?", "%#{term}%")
  end

  private

  attr_reader :term
end
