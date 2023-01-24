class Topic < ApplicationRecord
  has_many :exams
  has_many :questions

  validates :name, presence: true
end

