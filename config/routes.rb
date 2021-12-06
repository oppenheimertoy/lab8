Rails.application.routes.draw do
  get 'calc/input'
  get 'calc/view'
  post 'calc/input'
  post 'calc/view'

  root 'calc#input'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
