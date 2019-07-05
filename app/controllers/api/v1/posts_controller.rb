module Api
  module V1
    class PostsContoroller < ApplicatioonContoroller
      def index
        posts = Post.order(created_at: :desc)
        render json: { statusL 'SICCESS', message: 'loaded posts', data: posts}
      end
    end
  end
end