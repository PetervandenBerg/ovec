module ApplicationHelper
	def check_for_last_class(i)
		if i == 2
			return "last"
		end
	end

	def add_transparant_to_navbar
		if current_page?(root_path)
			return "transparent"
		end
	end
end
