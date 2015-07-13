class Question < ActiveRecord::Base
  has_many :responses
  has_many :survey_questions
  has_many :surveys, through: :survey_questions
  accepts_nested_attributes_for :responses, :allow_destroy => true

end

# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  question_text :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
