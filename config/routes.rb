ActionController::Routing::Routes.draw do |map|
  map.resources :semesters, :only => [ :index, :show ]
  map.resources :courses, :only => [ :index ], :collection => [ :auto_complete_for_searchkey ]
  map.resources :degree_requirements, :only => [ :index ]
  map.resources :wishlist_classes, :only => [ :index, :create, :update, :destroy ]
  map.resources :registered_classes, :only => [ :index, :create, :update, :destroy ]
  map.resources :sections, :only => [:index]
  map.resources :requirements, :only => [:index]

  map.root :controller => :courses, :action => :index
end
