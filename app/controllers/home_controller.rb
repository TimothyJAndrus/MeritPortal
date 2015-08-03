class HomeController < ApplicationController
  def index
    if mentee_signed_in?
      redirect_to mentee_home_url
    end
  end

  def about
  end

  def help
  end
end
