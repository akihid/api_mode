module Api
  module V1
    class PostsContoroller < ApplicatioonContoroller
      def index
        posts = Post.order(created_at: :desc)
        render json: { statusL 'SUCCESS', message: 'loaded posts', data: posts}
      end

      def show
        post = Post.find(params[:id])
        render json: { status: 'SUCCESS', message: 'loaded the post', data: post}
      end
    end
  end
end