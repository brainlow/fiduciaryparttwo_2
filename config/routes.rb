Rails.application.routes.draw do
  # Routes for the Matter resource:
  # CREATE
  get "/matters/new", :controller => "matters", :action => "new"
  post "/create_matter", :controller => "matters", :action => "create"

  # READ
  get "/matters", :controller => "matters", :action => "index"
  get "/matters/:id", :controller => "matters", :action => "show"

  # UPDATE
  get "/matters/:id/edit", :controller => "matters", :action => "edit"
  post "/update_matter/:id", :controller => "matters", :action => "update"

  # DELETE
  get "/delete_matter/:id", :controller => "matters", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
