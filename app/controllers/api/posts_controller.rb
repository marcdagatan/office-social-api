module Api
  class PostsController < ApiController
    def index
      render json: { posts: PostBlueprint.render_as_hash(Post.all) }
    end
  end
end
