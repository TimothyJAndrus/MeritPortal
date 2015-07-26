class SurveyController < ApplicationController

  before_action :authenticate_admin_user!, only: :index #only want the admin to be able to have control over surveys


  def index #get
    @Surveys = Survey.all
  end

  def show #get
  end

  def survey_response
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions


  end

  def update
    @survey = Survey.find(params[:id])
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to home_about_path}
      else
        format.html { render action: "edit" }
      end
    end
  end

private

  def survey_params
    params.require(:survey).permit(questions_attributes: [:id, responses_attributes: [:response_text]])
    #permit_params questions_attributes: [:question_text, :id, responses_attributes: [:response_text]]
  end


end
