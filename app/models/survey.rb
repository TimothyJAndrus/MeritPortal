class Survey < ActiveRecord::Base

  has_many :survey_questions
  has_many :questions, through: :survey_questions
  has_many :responses

  has_many :mentee_surveys, dependent: :destroy
  has_many :mentees, through: :mentee_surveys

  accepts_nested_attributes_for :questions, :responses, :allow_destroy => true

  after_create :associate_all_mentees

  validates :questions, presence: {message: "cannot be blank"}

  private
    def associate_all_mentees
      self.mentees = Mentee.all
    end

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
