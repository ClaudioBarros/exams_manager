class Question < ApplicationRecord
  has_one :topic

  has_many :exam_questions
  has_many :exams, through: :exam_questions, dependent: :destroy

  has_many :alternatives, dependent: :destroy

  validates :topic_id, presence: true
  validates :statement, presence: true

  accepts_nested_attributes_for :alternatives

end
