class BlogTag < ActiveRecord::Base
  has_many :blogs
  has_many :tags
end
