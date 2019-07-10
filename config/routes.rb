Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :rooms do 
    resources :users do 
      resources :bookings
      resources :reviews
    end
  end
  
end
