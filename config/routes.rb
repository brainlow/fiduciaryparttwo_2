Rails.application.routes.draw do
  root :to => "matters#index"
  # Routes for the Transaction resource:
  # CREATE
  get "/transactions/new", :controller => "transactions", :action => "new"
  post "/create_transaction", :controller => "transactions", :action => "create"

  # READ
  get "/transactions", :controller => "transactions", :action => "index"
  get "/transactions/:id", :controller => "transactions", :action => "show"

  # UPDATE
  get "/transactions/:id/edit", :controller => "transactions", :action => "edit"
  post "/update_transaction/:id", :controller => "transactions", :action => "update"

  # DELETE
  get "/delete_transaction/:id", :controller => "transactions", :action => "destroy"
  #------------------------------

  # Routes for the Beneficiary resource:
  # CREATE
  get "/beneficiaries/new", :controller => "beneficiaries", :action => "new"
  post "/create_beneficiary", :controller => "beneficiaries", :action => "create"

  # READ
  get "/beneficiaries", :controller => "beneficiaries", :action => "index"
  get "/beneficiaries/:id", :controller => "beneficiaries", :action => "show"

  # UPDATE
  get "/beneficiaries/:id/edit", :controller => "beneficiaries", :action => "edit"
  post "/update_beneficiary/:id", :controller => "beneficiaries", :action => "update"

  # DELETE
  get "/delete_beneficiary/:id", :controller => "beneficiaries", :action => "destroy"
  #------------------------------

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
