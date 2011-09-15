class Blog < ActiveRecord::Base
  has_many :tags, :through => :blog_tags

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
end
