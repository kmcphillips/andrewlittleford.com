AndrewlittlefordCom::Application.routes.draw do
  get "ping" => "ping#index"

  # news
  root :to => "posts#index"
  get 'news/:id' => 'posts#show'
  get 'rss.:format' => 'posts#rss'

  # blocks
  ['contact', 'links', 'bio', 'gallery', 'discography'].each do |block|
    get block => "blocks##{block}"
  end

  # media player
  get 'player/:id' => 'tracks#show'

  resources :events, :only => [:index, :show] do
    collection do
      get :archive
    end
  end

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
    resources :discography_entries, except: [:show] do
      collection { post 'sort'}
    end
    resources :links, :except => [:show] do
      collection { post 'sort'}
    end
    resources :posts, :except => [:show]
    resources :tracks, :except => [:show] do
      collection { post 'sort'}
    end
    resources :images, :only => [:index, :create, :destroy, :update] do
      collection { post 'sort'}
    end
    get 'galleries' => 'images#index'

    post 'preview/plain' => 'preview#plain'
  end
end
