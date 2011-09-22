class AddIndexToPages < ActiveRecord::Migration
  def self.up
  	add_index :pages, :url, :unique => true
  end

  def self.down
  	remove_index :pages, :url
  end
end
