class HashtagsController < ApplicationController
  def show
    @search = ShoutSearch.new(hashtag)
  end

  private

  def hashtag
    params[:id]
  end
end
