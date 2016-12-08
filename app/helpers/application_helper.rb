module ApplicationHelper
	def check_current(action)
	    if @current == action
		   'active'
	    else
		   'inactive'
	    end
	end
end

def set_course_stage stage
  	if stage == 'waiting'
		'预约中'
	elsif stage == 'ongoing'
		'进行中'
	elsif stage == 'finished'
		'已结课'
	elsif stage =='refused'
		'已拒绝'
	end
end
