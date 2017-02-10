Rails.application.routes.draw do
  get 'user/list'
  get 'user/new'
  post 'user/create'
  get 'event/list'
  post 'event/create'
  patch 'event/update'
  get 'event/view'
end
