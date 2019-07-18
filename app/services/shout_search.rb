class ShoutSearch
  attr_reader :term

  def initialize(term)
    @term = term
  end

  def run
    ShoutSearchQuery.new("##{term}").to_relation
  end

  alias_method :results, :run
end
