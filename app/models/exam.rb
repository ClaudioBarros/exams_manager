class Exam < ApplicationRecord

  belongs_to :topic
  has_and_belongs_to_many :questions
  has_many :users, through: :participants

  validates :topic_id, presence: true
  validates :name, presence: true

  accepts_nested_attributes_for :topic
  accepts_nested_attributes_for :questions

end

