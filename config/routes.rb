Rails.application.routes.draw do
  devise_scope :user do # This block of code is mandatory for devise to support logout in rails 7
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users

  # Defines the root path route ("/")
   root "home#index"

  resources 'recipes', only: %w[index show destroy]
end
