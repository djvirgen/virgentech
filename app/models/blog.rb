# == Schema Information
#
# Table name: blogs
#
#  id           :integer         not null, primary key
#  url          :string(255)
#  title        :string(255)
#  teaser       :string(255)
#  content      :string(255)
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Blog < ActiveRecord::Base
	# Pagination
	self.per_page = 10
	
	# Scopes
	default_scope :order => 'blogs.published_at DESC, blogs.created_at DESC'
	scope :published, where('published < ?', DateTime.now)
	
	# Validations
	validates :content, :presence => true, :length => { :maximum => 200_000 }
	validates :teaser, :presence => true, :length => { :maximum => 5_000 }
	
	# Finds a single post based on published year/month and url
	def self.find_published(year, month, url)
		date_start = DateTime.new(year.to_i, month.to_i, 1)
		date_end = date_start >> 1
		self.where(:url => url, :published_at => date_start..date_end).first
	end

	# Returns a paginated collection based on the specified page
	def self.paginated(page)
		self.paginate(:page => page)
	end
	
	# Returns true if this blog entry is a draft
	def draft?
		published_at.nil?
	end
	
	# Returns true if this blog entry is published
	def published?
		!published_at.nil?
	end
	
	def postdated?
		published_at > DateTime.now
	end
end
