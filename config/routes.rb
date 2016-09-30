Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }


  root'sites#home'

  get '/about', to: 'sites#about'
  get '/plan', to: 'sites#plan'
  get '/treat', to: 'sites#treat'
  get '/blog', to: 'sites#blog'
  get '/contact', to: 'sites#contact'

  get '/:user_id/hellofriend', to: 'guests#guest_input_form', as: "user_hellofriend"
  get '/:user_id/thankyou', to: 'guests#thankyou', as: "user_thankyou"
  resources :users do 
 
    get '/treat', to:'users#treat'
    get '/create', to:'users#c'
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
