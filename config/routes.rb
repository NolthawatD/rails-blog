Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifestv


  get "blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  get "blog_posts/:id", to: "blog_posts#show", as: :blog_post
  post "blog_posts", to: "blog_posts#create", as: :blog_posts
  # Defines the root path route ("/")
  root "blog_posts#index"

end
