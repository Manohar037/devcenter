Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources:articles
root 'welcome#index'
get 'search', to: "articles#search"
end