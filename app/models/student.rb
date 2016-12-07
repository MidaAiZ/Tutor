class Student < ActiveRecord::Base
	belongs_to :account
	has_and_belongs_to_many :courses
	has_many :teachers,
		     through: :courses,
	         source: :teachers
end
