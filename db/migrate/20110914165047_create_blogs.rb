class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :url
      t.string :title
      t.string :teaser
      t.string :content
      t.datetime :published

      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
