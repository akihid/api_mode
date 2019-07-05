Rails.application.routes.draw do
    namespace 'api' do
      namespace 'vi' do
        resources :posts
      end
    end
end
