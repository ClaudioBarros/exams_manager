class Topic < ApplicationRecord
  has_many :exams, dependent: :nullify
  has_many :questions, dependent: :nullify

  validates :name, presence: true
end

