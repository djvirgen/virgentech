class RenamePublishedColumn < ActiveRecord::Migration
  def self.up
  	rename_column :blogs, :published, :published_at
  end
  
  def self.down
	  rename_column :blogs, :published_at, :published
  end
end
