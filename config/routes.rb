Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "home#index"

  devise_scope :user do
    # This block of code is mandatory for devise to support logout in rails 7
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users

  # Defines the root path route ("/")
  resources 'public_recipes', only: %w[index] 
  resources 'recipes', only: %w[index show destroy new create] do
    resource 'recipe_foods', only: %w[create, destroy]
  end
  resources 'foods', only: %w[index new create destroy]
end
