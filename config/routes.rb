Rails.application.routes.draw do

scope :teachercenter, as: :teacenter do
    get '/' => 'teachercenter#index'
    get 'courses' => 'teachercenter#courses'
    get 'students' => 'teachercenter#students'
    get 'comments' => 'teachercenter#comments'
    get 'course/new' => 'teachercenter#new_course'
    get 'courses/:course_id' => 'teachercenter#course', as: :course
    post 'course/create' => 'teachercenter#create_course'
    post 'revise' => 'teachercenter#revise'
    post 'dispose/appoint' => 'teachercenter#dispose_course'
end

  scope :usercenter, as: :ucenter do
      get '/' => 'usercenter#index'
      get 'courses' => 'usercenter#courses'
      get 'course/:course_id' => 'usercenter#course', as: :course
      get 'messages' => 'usercenter#messages'
      get 'more' => 'usercenter#more'
      post 'revise' => 'usercenter#revise'
  end

  get 'login' => 'main#login', as: :login
  get 'register' => 'main#register', as: :register
  post 'login' => 'accounts#login'
  post 'register' => 'accounts#register'
  delete 'logout' => 'accounts#logout', as: :logout
  get 'students/:id/courses' => 'students#courses', as: :student_courses
  get 'students/:id/courses/:course_id' => 'students#course', as: :student_course
  get 'teachers/:teacher_id/courses/new' => 'courses#new', as: :appoint

  post 'courses/:id/entry' => 'courses#entry', as: :entry_course
  post 'courses/create' => 'courses#create', as: :create_course

  resources :courses do

  end

  resources :accounts do
  end
  resources :teachers
  resources :students
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
