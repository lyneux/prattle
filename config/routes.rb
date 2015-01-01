Prattle::Engine.routes.draw do
  root to: "categories#index"

	resources :categories do
		resources :forums do
			get :mark_as_read
  		resources :topics do
        get :lock, :unlock, :pin, :unpin
  			resources :posts do
        end
  		end
  	end
  end

  resource :member_setting, only: [:edit, :update]

  get '/recent_topics', to: 'forums#show_recent_topics', as: 'show_recent_topics'
	
end
