class Exam < ApplicationRecord
  has_one :topic

  has_and_belongs_to_many :questions

  has_many :participants
  has_many :users, through: :participants, dependent: :destroy

  has_many :user_answers, dependent: :destroy

  validates :topic_id, presence: true
  validates :name, presence: true

  accepts_nested_attributes_for :topic
  accepts_nested_attributes_for :questions

end

