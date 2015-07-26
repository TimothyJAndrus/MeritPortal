class Survey < ActiveRecord::Base

  has_many :survey_questions
  has_many :questions, through: :survey_questions
  has_many :responses

  has_many :mentee_surveys
  has_many :mentees, through: :mentee_surveys

  accepts_nested_attributes_for :questions, :responses, :allow_destroy => true

end

# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  due_date   :date
#
