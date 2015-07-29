class MenteeController < ApplicationController
  before_action :authenticate_mentee!

  def home
  end

  def list_surveys
    mentee_surveys = current_mentee.mentee_surveys
    completed_survey_ids = mentee_surveys.where(:is_done => true).pluck(:survey_id)
    incomplete_survey_ids = mentee_surveys.where(:is_done => false).pluck(:survey_id)
    # TODO: lookup join table scoping queries?
    completed_surveys = current_mentee.surveys.where(id: completed_survey_ids)
    incomplete_surveys = current_mentee.surveys.where(id: incomplete_survey_ids)
    @survey_hash = {"Incomplete Surveys" => incomplete_surveys, "Completed Surveys" => completed_surveys}

  end

  def complete
    @survey = current_mentee.surveys.find(params[:id])
  end
  #list all the surveys and the status of each survey, along with its due date

  #list the boolean in the join table, since that is specific to the one instance
end
