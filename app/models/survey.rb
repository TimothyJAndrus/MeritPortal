class Survey < ActiveRecord::Base

  has_many :survey_questions
  has_many :questions, through: :survey_questions

end

# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
