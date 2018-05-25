Rails.application.routes.draw do

	scope module: :v2, constraints: ApiVersion.new('v2') do
		resources :posts, only: :index
	end
	
	scope module: :v1, constraints: ApiVersion.new('v1', true) do
		resources :dislikes
		resources :likes
		resources :comments
		resources :posts
	end

	resources :users
	post 'auth/login', to: 'authentication#authenticate'
	post '/auth/login/twitter', to: 'authentication#authenticate_twitter'

end
