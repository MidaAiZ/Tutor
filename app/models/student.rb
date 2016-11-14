class Student < ActiveRecord::Base
	belongs_to :account
	has_many :courses
	has_many :teachers, through: :courses
end
