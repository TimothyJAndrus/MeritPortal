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
    @mentee_survey = @survey.mentee_surveys.where(:mentee_id => current_mentee.id).first_or_initialize
  end

  def update
     @mentee_survey = @survey.mentee_surveys.where(:mentee_id => current_mentee.id).first_or_initialize

     question_attributes = params[:survey][:questions_attributes]

     question_attributes.each do |key_id, value_hash|
       question = @survey.questions.where(:id => value_hash[:id]).first
       response = @survey.responses.where(:question_id => question.id, :mentee_id => current_mentee.id).first_or_initialize
       response.response_text = value_hash["responses_attributes"].values.first[:response_text]
       response.save!
     end




    # if @mentee_survey.is_done = true
    #   current_mentee.responses.where(:survey_id => @mentee_survey.survey_id).destroy_all
    # else
    # end
    # current_mentee.responses = params[:survey][:response_attributes]
    # @mentee_responses = current_mentee.responses
    # @mentee_response = @mentee_responses.where(:question_id = params[:question_d], :survey_id).first_or_create
    respond_to do |format|
      if @survey.save!
        @mentee_survey.is_done = true
        @mentee_survey.save
        format.html { redirect_to mentee_list_surveys_path }
      else
        format.html { render action: "survey_response" }
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
    params.require(:survey).permit(questions_attributes: [:question_id, responses_attributes: [:response_text]])
    #permit_params questions_attributes: [:question_text, :id, responses_attributes: [:response_text]]
  end


end
