class Teacher < ActiveRecord::Base
	belongs_to :account
	has_many :courses
	# has_many :students, through: :course
	has_many :students,
            # class_name: 'Index::Student',
            through: :courses,
            source: "students"
end
