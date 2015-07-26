class MenteeController < ApplicationController
  before_action :authenticate_mentee!

  def home
  end

  def list_survey
  end
  #list all the surveys and the status of each survey, along with its due date

  #list the boolean in the join table, since that is specific to the one instance
end
