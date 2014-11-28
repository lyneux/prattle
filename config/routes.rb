Prattle::Engine.routes.draw do
	resources :categories do
		resources :forums do
			get :mark_as_read
  			resources :topics do
  				resources :posts
  			end
  		end
  	end
  	root to: "categories#index"
end
