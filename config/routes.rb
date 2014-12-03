Prattle::Engine.routes.draw do
	resources :categories do
		resources :forums do
			get :mark_as_read
  			resources :topics do
  				resources :posts
  			end
  		end
  	end

  	get '/recent_topics', to: 'forums#show_recent_topics', as: 'show_recent_topics'

  	root to: "categories#index"
end
