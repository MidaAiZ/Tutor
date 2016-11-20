module UsercenterHelper
	def check_current(action)
	    if @current == action
		   'active'
	    else
		   'inactive'
	    end
	end

end
