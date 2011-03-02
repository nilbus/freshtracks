Freshtracks::Application.routes.draw do
  resources :semesters
  resources :courses do
    get :autocomplete_course_searchkey, :on => :collection
  end

  resources :degree_requirements
  resources :wishlist_sections do
    post :register_all, :on => :collection
  end

  resources :registered_sections
  resources :sections
  match '/' => 'courses#index'

end
