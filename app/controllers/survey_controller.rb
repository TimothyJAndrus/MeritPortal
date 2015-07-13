class SurveyController < ApplicationController

  #before_action :authenticate_admin_user! #only want the admin to be able to have control over surveys


  def index #get
  end

  def show #get
  end

  def survey_response
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions.build
    @responses = @questions.responses.build



      # = simple_form_for @survey do |blah|
      #   = blah.simple_fields_for :questions do |q|
      #     = q.object.question_text
      #     = q.simple_fields_for :responses do |r|
      #       = r.response_text


  end

private

  def survey_params

  end


end
