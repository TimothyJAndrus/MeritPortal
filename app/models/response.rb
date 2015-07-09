class Response < ActiveRecord::Base
  has_one :survey
  has_one :question
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
