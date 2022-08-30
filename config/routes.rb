Rails.application.routes.draw do
 # Defines the root path route ("/")
 root "home#index"

  devise_scope :user do # This block of code is mandatory for devise to support logout in rails 7
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users
  
  #------- Foods Routes----------
   resources 'foods', only: %w[index new create destroy] 
  #------- End Foods Routes----------
    #------- Public Recipes Route----------
    resources 'public_recipes', only: %w[index] 
    #------- End Public Recipes Route----------
 
end
