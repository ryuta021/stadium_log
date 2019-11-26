Rails.application.routes.draw do


  #root :to => 'public/posts#index_top'
  root :to => 'public/stadium#index'
  get 'about' => 'public/stadium#about'

  namespace :admin do
    resources :users, only: [:edit, :update, :show, :index, :destroy]
    resources :team, only: [:edit, :update, :create, :index, :destroy]
    resources :stadium, only: [:edit, :update, :create, :index, :destroy]
    resources :posts, only: [:edit, :update, :show, :index, :destroy]
  end

  devise_for :admin_users, controllers: {
            sessions: 'admin/admin_users/sessions',
            registrations: 'admin/admin_users/registrations',
            passwords: 'admin/admin_users/passwords'
      }


  devise_for :users,controllers: {
          sessions: 'public/users/sessions',
          registrations: 'public/users/registrations',
          passwords: 'public/users/passwords'
    }


  namespace :public do
     resources :users, only: [:show, :update, :edit ]do
      resources :relationships, only: [:create, :destroy, :index,]
     end

     resources :stadium, only: [:show, :create, :destroy ] do

    end

     resources :posts,  only: [:show, :index, :destroy, :edit, :new, :create, :update  ]do
       get 'detail_search'
       get 'favorite_post'
     resource :favorites, only: [:create, :destroy]
     end
  end

# only: [:index, :create, :show, :new, :destroy]



   # devise_for :admin_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

