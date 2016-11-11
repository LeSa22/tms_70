class Course < ApplicationRecord
  has_many :course_subjects
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects

  enum status: {deactive: 0, active: 1}

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: Settings.length}

  scope :course, ->course_id do
    find_by id: course_id
  end
end
