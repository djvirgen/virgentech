class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :tag
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end