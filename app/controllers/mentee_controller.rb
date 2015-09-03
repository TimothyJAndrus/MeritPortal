class MenteeController < ApplicationController
  before_action :redirect_if_already_signed_in!
  before_action :find_survey, only: [:answers, :complete]
  before_action :survey_hash, only: [:home, :list_surveys]

  def home
    @mentee = current_mentee
  end

  def list_surveys
  end

  def answers
    @questions = @survey.questions
  end

  def complete
  end
  #list all the surveys and the status of each survey, along with its due date

  #list the boolean in the join table, since that is specific to the one instance
private
    def find_survey
      @survey = current_mentee.surveys.find(params[:survey_id])
    end

    def survey_hash
      mentee_surveys = current_mentee.mentee_surveys
      completed_survey_ids = mentee_surveys.where(:is_done => true).pluck(:survey_id)
      incomplete_survey_ids = mentee_surveys.where(:is_done => false).pluck(:survey_id)
      # TODO: lookup join table scoping queries?
      completed_surveys = current_mentee.surveys.where(id: completed_survey_ids)
      @incomplete_surveys = current_mentee.surveys.where(id: incomplete_survey_ids)
      @survey_hash = {"Incomplete Surveys" => @incomplete_surveys, "Completed Surveys" => completed_surveys}
    end

    def redirect_if_already_signed_in!
      if mentor_signed_in?
        redirect_to mentor_home_path
      else
        :authenticate_mentee!
      end
    end
end
