class User < ApplicationRecord
  has_many :user_courses
  has_many :activities, dependent: :destroy
  has_many :courses, through: :user_courses
  has_many :user_subjects
  has_many :subjects, through: :user_subjects

  enum role: {trainee: 0, supervisor: 1, admin: 2}

  validates :name, presence: true
  mount_uploader :avatar, PictureUploader
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  scope :recent, ->{order create_at: :desc}
end
