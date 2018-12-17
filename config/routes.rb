Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "matters#index"
  # Routes for the Occupation resource:

  # CREATE
  get("/occupations/new", { :controller => "occupations", :action => "new_form" })
  post("/create_occupation", { :controller => "occupations", :action => "create_row" })
  post("/create_occupation_from_organization", { :controller => "occupations", :action => "create_row_from_organization" })

  # READ
  get("/occupations", { :controller => "occupations", :action => "index" })
  get("/occupations/:id_to_display", { :controller => "occupations", :action => "show" })

  # UPDATE
  get("/occupations/:prefill_with_id/edit", { :controller => "occupations", :action => "edit_form" })
  post("/update_occupation/:id_to_modify", { :controller => "occupations", :action => "update_row" })

  # DELETE
  get("/delete_occupation/:id_to_remove", { :controller => "occupations", :action => "destroy_row" })
  get("/delete_occupation_from_organization/:id_to_remove", { :controller => "occupations", :action => "destroy_row_from_organization" })
  get("/delete_occupation_from_user/:id_to_remove", { :controller => "occupations", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Asset value resource:

  # CREATE
  get("/asset_values/new", { :controller => "asset_values", :action => "new_form" })
  post("/create_asset_value", { :controller => "asset_values", :action => "create_row" })
  post("/create_asset_value_from_asset", { :controller => "asset_values", :action => "create_row_from_asset" })

  # READ
  get("/asset_values", { :controller => "asset_values", :action => "index" })
  get("/asset_values/:id_to_display", { :controller => "asset_values", :action => "show" })

  # UPDATE
  get("/asset_values/:prefill_with_id/edit", { :controller => "asset_values", :action => "edit_form" })
  post("/update_asset_value/:id_to_modify", { :controller => "asset_values", :action => "update_row" })

  # DELETE
  get("/delete_asset_value/:id_to_remove", { :controller => "asset_values", :action => "destroy_row" })
  get("/delete_asset_value_from_asset/:id_to_remove", { :controller => "asset_values", :action => "destroy_row_from_asset" })

  #------------------------------

  # Routes for the Assignment resource:

  # CREATE
  get("/assignments/new", { :controller => "assignments", :action => "new_form" })
  post("/create_assignment", { :controller => "assignments", :action => "create_row" })
  post("/create_assignment_from_organization", { :controller => "assignments", :action => "create_row_from_organization" })
  post("/create_assignment_from_matter", { :controller => "assignments", :action => "create_row_from_matter" })

  # READ
  get("/assignments", { :controller => "assignments", :action => "index" })
  get("/assignments/:id_to_display", { :controller => "assignments", :action => "show" })

  # UPDATE
  get("/assignments/:prefill_with_id/edit", { :controller => "assignments", :action => "edit_form" })
  post("/update_assignment/:id_to_modify", { :controller => "assignments", :action => "update_row" })

  # DELETE
  get("/delete_assignment/:id_to_remove", { :controller => "assignments", :action => "destroy_row" })
  get("/delete_assignment_from_organization/:id_to_remove", { :controller => "assignments", :action => "destroy_row_from_organization" })
  get("/delete_assignment_from_matter/:id_to_remove", { :controller => "assignments", :action => "destroy_row_from_matter" })
  get("/delete_assignment_from_user/:id_to_remove", { :controller => "assignments", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Organization resource:

  # CREATE
  get("/organizations/new", { :controller => "organizations", :action => "new_form" })
  post("/create_organization", { :controller => "organizations", :action => "create_row" })

  # READ
  get("/organizations", { :controller => "organizations", :action => "index" })
  get("/organizations/:id_to_display", { :controller => "organizations", :action => "show" })

  # UPDATE
  get("/organizations/:prefill_with_id/edit", { :controller => "organizations", :action => "edit_form" })
  post("/update_organization/:id_to_modify", { :controller => "organizations", :action => "update_row" })

  # DELETE
  get("/delete_organization/:id_to_remove", { :controller => "organizations", :action => "destroy_row" })

  #------------------------------

  # Routes for the Transaction resource:

  # CREATE
  get("/transactions/new", { :controller => "transactions", :action => "new_form" })
  post("/create_transaction", { :controller => "transactions", :action => "create_row" })
  post("/create_transaction_from_asset", { :controller => "transactions", :action => "create_row_from_asset" })

  # READ
  get("/transactions", { :controller => "transactions", :action => "index" })
  get("/transactions/:id_to_display", { :controller => "transactions", :action => "show" })

  # UPDATE
  get("/transactions/:prefill_with_id/edit", { :controller => "transactions", :action => "edit_form" })
  post("/update_transaction/:id_to_modify", { :controller => "transactions", :action => "update_row" })

  # DELETE
  get("/delete_transaction/:id_to_remove", { :controller => "transactions", :action => "destroy_row" })
  get("/delete_transaction_from_asset/:id_to_remove", { :controller => "transactions", :action => "destroy_row_from_asset" })

  #------------------------------

  # Routes for the Asset resource:

  # CREATE
  get("/assets/new", { :controller => "assets", :action => "new_form" })
  post("/create_asset", { :controller => "assets", :action => "create_row" })
  post("/create_asset_from_matter", { :controller => "assets", :action => "create_row_from_matter" })

  # READ
  get("/assets", { :controller => "assets", :action => "index" })
  get("/assets/:id_to_display", { :controller => "assets", :action => "show" })

  # UPDATE
  get("/assets/:prefill_with_id/edit", { :controller => "assets", :action => "edit_form" })
  post("/update_asset/:id_to_modify", { :controller => "assets", :action => "update_row" })

  # DELETE
  get("/delete_asset/:id_to_remove", { :controller => "assets", :action => "destroy_row" })
  get("/delete_asset_from_matter/:id_to_remove", { :controller => "assets", :action => "destroy_row_from_matter" })

  #------------------------------

  # Routes for the Matter resource:

  # CREATE
  get("/matters/new", { :controller => "matters", :action => "new_form" })
  post("/create_matter", { :controller => "matters", :action => "create_row" })

  # READ
  get("/matters", { :controller => "matters", :action => "index" })
  get("/matters/:id_to_display", { :controller => "matters", :action => "show" })

  # UPDATE
  get("/matters/:prefill_with_id/edit", { :controller => "matters", :action => "edit_form" })
  post("/update_matter/:id_to_modify", { :controller => "matters", :action => "update_row" })

  # DELETE
  get("/delete_matter/:id_to_remove", { :controller => "matters", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
