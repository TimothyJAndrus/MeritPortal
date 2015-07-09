class Survey < ActiveRecord::Base

  has_many :survey_questions
  has_many :questions, through: :survey_questions

  accepts_nested_attributes_for :questions, :allow_destroy => true

end

# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
