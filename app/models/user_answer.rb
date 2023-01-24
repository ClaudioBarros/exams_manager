class UserAnswer < ApplicationRecord
  belongs_to :user 
  belongs_to :exam
  belongs_to :alternative

  validates :user_id, presence: true
  validates :exam_id, presence: true
  validates :alternative_id, presence: true
end
