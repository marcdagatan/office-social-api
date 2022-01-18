# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

require "rails_helper"

RSpec.describe Post, type: :model do
  describe "#validations" do
    it { is_expected.to validate_presence_of(:body) }
  end

  describe "#associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one_attached(:media) }
  end
end
