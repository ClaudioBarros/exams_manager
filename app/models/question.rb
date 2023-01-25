class Question < ApplicationRecord
  has_one :topic

  has_and_belongs_to_many :exams

  has_many :alternatives, dependent: :destroy

  validates :topic_id, presence: true
  validates :statement, presence: true

  accepts_nested_attributes_for :alternatives

end
