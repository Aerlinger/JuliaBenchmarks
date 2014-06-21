Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#home"

  get "/demo" => "repl#demo"
  post "/run" => "repl#run"
end
