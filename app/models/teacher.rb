class Teacher < ActiveRecord::Base
	belongs_to :account
	has_many :courses
	has_many :students,
             through: :courses,
             source: :students
	has_many :comments,
	         through: :courses,
			 source: :comments
end
