Rails.application.routes.draw do
  root to: "static_pages#home"

  get "/demo" => "repl#demo"
end
