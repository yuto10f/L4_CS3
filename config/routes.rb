Rails.application.routes.draw do
 get 'top/main'
 post 'top/login'
 root 'top#main'
 get 'top/logout'
 get 'top/form'
 post 'top/create'
end
