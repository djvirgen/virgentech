class Blog < ActiveRecord::Base
	self.per_page = 10
	
	# Finds a single post based on published year/month and url
  def self.find_published(year, month, url)
    now = DateTime.now

    date_start = DateTime.new(year.to_i, month.to_i, 1)
    # Do not return blog entries from the future
    if (date_start > now)
      return nil
    end

    date_end = date_start >> 1
    # Again, ensure that future blog entries are not returned
    if (date_end > now)
      date_end = now
    end

    self.where(:url => url, :published => date_start..date_end).first
  end

	# Returns a paginated collection based on the specified page
	def self.paginated(page)
		self.paginate(:page => page)
	end
end
