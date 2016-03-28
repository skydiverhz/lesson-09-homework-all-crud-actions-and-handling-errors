Rails.application.routes.draw do
  get 'articles/new'

  get 'articles/edit'

  get 'articles/index'

  get 'articles/show'

  get 'articles/delete'

 resources :articles do
    get :delete, :on => :member
  end
  root 'articles#index'
end
