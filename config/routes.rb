Rails.application.routes.draw do
  # mount Rack::GridFS::Endpoint.new(:db => Mongoid.database), :at => "gridfs"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # match '/uploads/grid/user/avatar/:id/:filename' => 'gridfs#avatar', via: [:get, :post]


  # and in routes.rb
  resources :users do
    get :avatar, on: :member
    post :file, on: :member
  end

end
