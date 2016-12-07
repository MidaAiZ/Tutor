class Teacher < ActiveRecord::Base
	belongs_to :account
	has_many :courses
	has_many :students,
             through: :courses,
             source: :students
end
