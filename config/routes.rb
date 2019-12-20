Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tops#index"
  #top
  get 'tops', to: 'tops#index'
  get 'tops/lists', to: 'tops#lists'
  post 'tops/lists', to: 'tops#lists'

  #reviews
  get 'reviews', to: 'reviews#index'
  post 'reviews', to: 'reviews#index'
  get 'reviews/add_review', to: 'reviews#add_review'
  post 'reviews/create', to: 'reviews#create'

  #login
  get 'login', to: 'login#index'
  post 'login', to: 'login#create'
  delete 'logout', to: 'login#destroy'

  #add_user
  get 'add_users', to: 'add_users#index'
  post 'add_users/confirm', to: 'add_users#confirm'  
  post 'add_users/create', to: 'add_users#create'
  
  #profile
  get 'profiles', to: 'profiles#index'
  get 'profiles/edit', to: 'profiles#edit'
  get 'profiles/delete', to: 'profiles#delete'

  #other_add
  get 'other_add', to: 'other_add#index'
  post 'other_add/create', to: 'other_add#create'
  get 'other_add/edit', to: 'other_add#edit'
  patch 'other_add/update', to: 'other_add#update'

end
