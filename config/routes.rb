Rails.application.routes.draw do
  
  get 'comments/create'

  devise_for :users
  
  resources :topics do
    resources :posts, except: [:index] 
  end

  resources :post, only: [] do
    resources :comments, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote

  end


  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
