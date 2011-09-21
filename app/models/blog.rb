class Blog < ActiveRecord::Base
	# Pagination
	self.per_page = 10
	
	# Scopes
	scope :published, where('published < ?', DateTime.now)
	
	# Finds a single post based on published year/month and url
  def self.find_published(year, month, url)
    date_start = DateTime.new(year.to_i, month.to_i, 1)
    date_end = date_start >> 1
    self.where(:url => url, :published => date_start..date_end).first
  end

	# Returns a paginated collection based on the specified page
	def self.paginated(page)
		self.paginate(:page => page)
	end
end
