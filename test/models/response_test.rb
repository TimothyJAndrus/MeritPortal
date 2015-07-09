require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: responses
#
#  id             :integer          not null, primary key
#  survey_id      :integer
#  question_id    :integer
#  response_text  :text
#  response_range :integer
#  mentee_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
