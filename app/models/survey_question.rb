class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey, class_name: "Survey", foreign_key: "survey_id"
  belongs_to :question
end

# == Schema Information
#
# Table name: survey_questions
#
#  id          :integer          not null, primary key
#  survey_id   :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
