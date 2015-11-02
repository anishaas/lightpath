class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  has_secure_password
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :teachers, through: :courses
  has_many :lightbulbs
  has_many :submissions
end
