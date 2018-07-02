Rails.application.routes.draw do
  # Routes for the Fiduciary resource:
  # CREATE
  get "/fiduciaries/new", :controller => "fiduciaries", :action => "new"
  post "/create_fiduciary", :controller => "fiduciaries", :action => "create"

  # READ
  get "/fiduciaries", :controller => "fiduciaries", :action => "index"
  get "/fiduciaries/:id", :controller => "fiduciaries", :action => "show"

  # UPDATE
  get "/fiduciaries/:id/edit", :controller => "fiduciaries", :action => "edit"
  post "/update_fiduciary/:id", :controller => "fiduciaries", :action => "update"

  # DELETE
  get "/delete_fiduciary/:id", :controller => "fiduciaries", :action => "destroy"
  #------------------------------

  # Routes for the Asset resource:
  # CREATE
  get "/assets/new", :controller => "assets", :action => "new"
  post "/create_asset", :controller => "assets", :action => "create"

  # READ
  get "/assets", :controller => "assets", :action => "index"
  get "/assets/:id", :controller => "assets", :action => "show"

  # UPDATE
  get "/assets/:id/edit", :controller => "assets", :action => "edit"
  post "/update_asset/:id", :controller => "assets", :action => "update"

  # DELETE
  get "/delete_asset/:id", :controller => "assets", :action => "destroy"
  #------------------------------

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
