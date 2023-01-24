class Alternative < ApplicationRecord
  belongs_to :question

  validates :statement, presence: true
  validates :value, inclusion: {in: [true, false]}
end
