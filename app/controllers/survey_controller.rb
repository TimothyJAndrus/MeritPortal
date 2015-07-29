class SurveyController < ApplicationController

  before_action :authenticate_admin_user!, only: :index #only want the admin to be able to have control over surveys
  before_action :set_survey, only: [:show, :survey_response, :update]

  def index #get
    @Surveys = Survey.all
  end

  def show #get
  end

  def survey_response
    @questions = @survey.questions
  end

  def update
    @mentee_survey = @survey.mentee_surveys.where(:mentee_id => current_mentee.id).first_or_initialize
    respond_to do |format|
      if @survey.update(survey_params)
        @mentee_survey.is_done = true
        @mentee_survey.save
        format.html { redirect_to mentee_list_surveys_path }
      else
        format.html { render action: "edit" }
      end
    end
  end

private

  def set_survey
    if admin_user_signed_in?
      @survey = Survey.find(params[:id])
    else
      @survey = current_mentee.surveys.find(params[:id])
    end
  end

  def survey_params
    params.require(:survey).permit(mentee_attributes: [:id], questions_attributes: [:id, responses_attributes: [:response_text]])
    #permit_params questions_attributes: [:question_text, :id, responses_attributes: [:response_text]]
  end


end
