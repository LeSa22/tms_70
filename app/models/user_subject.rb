class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :user_course
  belongs_to :subject

  has_many :user_task, dependent: :destroy

  enum status: {pending: 0, started: 1, finished: 2}
end
