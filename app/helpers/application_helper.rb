module ApplicationHelper
	def body_class(css_class = nil)
		@body_classes = 'container' if @body_classes.nil?
		@body_classes << (' ' + css_class) if !css_class.nil?
		return @body_classes
	end
end
