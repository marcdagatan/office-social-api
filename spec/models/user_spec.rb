# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require "rails_helper"

RSpec.describe User, type: :model do
  describe "#validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_values("marc@test.dev", "test@dev.co").for(:email) }
    it { is_expected.not_to allow_values("marc@test, test$#23@dev.co").for(:email) }
    it { is_expected.to validate_presence_of(:password) }

    describe "associations" do
      it { is_expected.to have_many(:posts).dependent(:destroy) }
    end
  end
end
