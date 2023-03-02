Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  post "/users", to: "users#create"
  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"
end
