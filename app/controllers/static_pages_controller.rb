class StaticPagesController < ApplicationController

  def landing_Page
  end

  def feed
    @events = Event.all.sort(created_at: -1)
  end

  def about
  end

end
