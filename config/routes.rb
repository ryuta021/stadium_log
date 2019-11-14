Rails.application.routes.draw do


  #root :to => 'public/posts#index_top'
  root :to => 'public/stadium#index'

  namespace :admin do
    resources :users, only: [:edit, :update, :show, :index, :destroy]
    resources :team, only: [:edit, :update, :create, :index, :destroy]
    resources :stadium, only: [:edit, :update, :create, :index, :destroy]
    resources :posts, only: [:edit, :update, :show, :index, :destroy]
  end

  devise_for :admin_users, controllers: {
            sessions: 'admin/admin_user/sessions',
            registrations: 'admin/admin_user/registrations',
            passwords: 'admin/admin_user/passwords'
      }




  devise_for :users,controllers: {
          sessions: 'public/users/sessions',
          registrations: 'public/users/registrations',
          passwords: 'public/users/passwords'
    }



   scope module: :public do
     resources :users, only: [:show, :update, :edit, ]
     resources :stadium, only: [:show, :create, :destroy, ]
     resources :posts do
     resource :favorites, only: [:create, :destroy]
     end
  end

# only: [:index, :create, :show, :new, :destroy]



   # devise_for :admin_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

