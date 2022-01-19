module Api
  class PostsController < ApiController
    def index
      posts = policy_scope(Post).ransack(params[:query]).result(distinct: true).includes(:author)
      posts = posts.page(params[:page] || 1).per(params[:per_page] || PER_PAGE)

      render json: { posts: PostBlueprint.render_as_hash(posts) }
    end

    def create
      post = Post.new(create_params)

      authorize post

      post_response(post) { post.save }
    end

    def update
      post = Post.find(params[:id])

      authorize post

      post_response(post) { post.update(update_params) }
    end

    def destroy
      post = Post.find(params[:id])

      authorize post

      post.destroy!

      render status: :ok
    end

    private

    def update_params
      params.require(:post).permit(:body, :media)
    end

    def create_params
      update_params.merge(author: current_user)
    end

    def post_response(post)
      if yield
        render json: PostBlueprint.render_as_hash(post), status: :ok
      else
        render json: { errors: post.errors }, status: :unprocessable_entity
      end
    end
  end
end
