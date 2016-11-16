class Student < ActiveRecord::Base
	has_one :account
	has_many :courses
	has_many :teachers, through: :courses
end
