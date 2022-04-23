Rails.application.routes.draw do
  resources :uploaders do
    member do
      delete :delete_file
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "uploaders#index"
end
