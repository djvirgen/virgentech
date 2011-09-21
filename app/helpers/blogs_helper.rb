module BlogsHelper
	def blog_class(blog)
		classes = ['blog']
		classes.push('draft') if blog.draft?
		classes.push('postdated') if blog.postdated?
		return classes
	end
end
