module Api
  class PostsController < ApiController
    def index
      query = Post.ransack(params[:query]).result(distinct: true).includes(:author)
      query = query.page(params[:page] || 1).per(params[:per_page] || PER_PAGE)

      render json: { posts: PostBlueprint.render_as_hash(query) }
    end
  end
end
