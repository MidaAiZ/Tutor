module TeachercenterHelper
	def set_ele_id(type)
		if type == 'all'
			'all-courses'
		elsif type == 'true'
			'public-courses'
		elsif type == 'false'
			'private-courses'
		end
	end
end
