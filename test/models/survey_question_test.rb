require 'test_helper'

class SurveyQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
