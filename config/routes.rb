Rails.application.routes.draw do


 root :to => 'public/posts#index_top'

  namespace :admin do
    resources :users, only: [:edit, :update, :show, :index, :destroy]
    resources :team, only: [:edit, :update, :create, :index, :destroy]
    resources :stadium, only: [:edit, :update, :create, :index, :destroy]
    get 'stadium/index'
    post 'stadium/create'
    resources :posts, only: [:edit, :update, :show, :index, :destroy]
  end


   scope module: :public do
     resources :users, only: [:update, :edit, :show ]
     resources :posts, only: [:index, :create, :show, :new, :destroy]
      get 'posts/index'
      post 'posts/create'
  end


  devise_for :users,controllers: {
          sessions: 'public/users/sessions',
          registrations: 'public/users/registrations',
          passwords: 'public/users/passwords'
    }

# devise_for :admin_users, controllers: {
#           sessions: 'admin/admin_users/sessions',
#           registrations: 'admin/admin_users/registrations',
#           passwords: 'admin/admin_users/passwords'
#     }



   devise_for :admin_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

