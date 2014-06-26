Rails.application.routes.draw do
  devise_for :users
  root to: "repl#demo"

  get "/users/:id"      => "users#show"
  get "/users/edit/:id" => "users#edit"
  put "/users/edit/:id" => "users#update"

  get "/snippets/:id"       => "snippets#show"
  get "/snippets/:id/edit"  => "snippets#edit"
  post "/snippets/:id/fork" => "snippets#fork"
  delete "/snippets/:id"    => "snippets#delete"

  get "/demo" => "repl#demo"
  post "/run" => "repl#run"
end
