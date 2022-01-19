class PostBlueprint < Blueprinter::Base
  identifier :id

  fields :body, :updated_at, :created_at

  field :media_url do |post, _options|
    if post.media.attached?
      if Rails.env.test? || Rails.env.development?
        Rails.application.routes.url_helpers.rails_blob_path(post.media, only_path: true)
      else
        post.media.url
      end
    end
  end

  association :author, blueprint: UserBlueprint
end
