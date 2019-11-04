Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'

    get 'user/index'
    get 'user/show'
    get 'user/edit'
    get 'user/update'
    get 'user/destroy'

    resources :stadium, only: [:edit, :update, :create, :index, :destroy]
    get 'stadium/index'
    post 'stadium/create'
    resources :posts
  end

   scope module: :public do
    get 'posts/index'
    get 'posts/index_top'
    get 'posts/new'
    get 'posts/show'
    post 'posts/create'
    get 'posts/destroy'
  end


  devise_for :users
  devise_for :admin_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

