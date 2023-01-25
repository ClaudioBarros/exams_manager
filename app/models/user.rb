class User < ApplicationRecord
  has_many :participants
  has_many :exams, through: :participants, dependent: :destroy
  has_many :user_answers, dependent: :destroy
  has_secure_password
end
