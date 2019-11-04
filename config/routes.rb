Rails.application.routes.draw do

  namespace :admin do
   resources :stadium, only: [:edit, :update, :create, :index, :destroy]
   get 'stadium/index'
    post 'stadium/create'
   resources :posts
  end
  devise_for :users
  devise_for :admin_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


#     post 'stadium/create'
#     get 'stadium/destroy'
#     get 'stadium/update'

 # namespace :admin do
 #    get 'posts/index'
 #    get 'posts/edit'
 #    get 'posts/destroy'
 #    get 'posts/update'
 #  end