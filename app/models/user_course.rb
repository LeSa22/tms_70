class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :user_subjects
  has_many :subjects, through: :user_subjects
  enum status: {pending: 0, progress: 1, finished: 2}
  scope :inprogress, -> do
    find_by status: UserCourse.statuses[:progress]
  end
end
