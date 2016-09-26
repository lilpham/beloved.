Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }


  root'sites#home'

  get '/about', to: 'sites#about'
  get '/plan', to: 'sites#plan'
  get '/treat', to: 'sites#treat'
  get '/blog', to: 'sites#blog'
  get '/contact', to: 'sites#contact'


  resources :users do 
    get '/treat', to:'users#treat'
    get '/create', to:'users#create'
    get '/settings', to:'users#settings'
    get '/account', to:'users#account'

    resources :expenses
    resources :guests 

    resources :checklists do 
  	 resources :tasks
    end

  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
