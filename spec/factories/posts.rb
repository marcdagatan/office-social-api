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

FactoryBot.define do
  factory :post do
    body { "MyText" }
    media { nil }
    association :user, factory: :user

    after(:build) do |post|
      post.image.attach(
        io: File.open(Rails.root.join("spec/fixtures/images/dummy.png")),
        filename: "dummy.png",
        content_type: "image/png"
      )
    end
  end
end
