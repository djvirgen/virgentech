class Tag < ActiveRecord::Base
  has_many :blogs, :through => :blog_tags
end
