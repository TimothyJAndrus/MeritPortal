class MenteeController < ApplicationController
  before_action :authenticate_mentee!

  def home
  end

end
