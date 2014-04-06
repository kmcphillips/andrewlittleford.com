AndrewlittlefordCom::Application.routes.draw do
  # news
  root :to => "posts#index"
  get 'news/:id' => 'posts#show'
  get 'rss.:format' => 'posts#rss'

  # blocks
  ['contact', 'links', 'bio', 'gallery'].each do |block|
    get block => "blocks##{block}"
  end

  # media player
  get 'player/:id' => 'tracks#show'

  resources :events, :only => [:index, :show]

  get 'login' => 'admin/sessions#new'

  # admin
  namespace :admin do
    get 'login' => 'sessions#new'
    get 'logout' => 'sessions#logout'
    delete 'logout' => 'sessions#logout'

    root :to => "posts#index"
    
    resources :sessions do
      collection do
        get 'password'
        post 'change_password'
      end
    end

    resources :blocks, :except => [:destroy, :create, :new, :show]
    resources :medias, :only => [:edit, :update]
    resources :events, :except => [:show]
    resources :links, :except => [:show] do
      collection { post 'sort'}
    end
    resources :posts, :except => [:show]
    resources :tracks, :except => [:show] do
      collection { post 'sort'}
    end
    resources :galleries, :only => [:index]
    resources :images, :only => [:create, :destroy, :update] do
      collection { post 'sort'}
    end
  end
end
