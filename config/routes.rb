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
  get 'reviews/detail', to: 'reviews#detail'
  post 'reviews/detail', to: 'reviews#detail'
  #empathies
  post 'empathies/create', to: 'empathies#create'
  delete 'empathies/delete', to: 'empathies#delete'
  #Performance_search
  post 'performance_search/search', to: 'performance_search#search'

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
  get 'profiles/edit_profile', to: 'profiles#edit_profile'
  patch 'profiles/update', to: 'profiles#update'
  get 'profiles/pass', to: 'profiles#pass'
  put 'profiles/pass_update', to: 'profiles#pass_update'
  #delere_reviews
  put 'delete_reviews/update', to: 'delete_reviews#update'

  #other_add
  get 'other_add', to: 'other_add#index'
  post 'other_add/create', to: 'other_add#create'
  get 'other_add/edit', to: 'other_add#edit'
  patch 'other_add/update', to: 'other_add#update'
  get 'other_add/test', tp: 'other_add#test'
end
