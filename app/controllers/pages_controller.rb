class PagesController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users,:comments)
  end

  def help
  end
end
