SocialThingamajig::Application.routes.draw do
  resources :users
  resource :session do
    member do
      get :recover_password
      post :recover_password, to: 'sessions#send_password'
      get :update_password
    end
  end
  resources :friend_circles
  resources :posts, :only => [:create]

end
