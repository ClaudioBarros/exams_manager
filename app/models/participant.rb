class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :exam

  validates :user_id, presence: true
  validates :exam_id, presence: true
end
