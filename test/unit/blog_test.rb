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

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
