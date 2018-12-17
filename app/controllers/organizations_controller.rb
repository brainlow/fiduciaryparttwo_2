class OrganizationsController < ApplicationController
  def index
    @q = Organization.ransack(params[:q])
    @organizations = @q.result(:distinct => true).includes(:assignments, :employees, :users, :matters).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@organizations.where.not(:address_latitude => nil)) do |organization, marker|
      marker.lat organization.address_latitude
      marker.lng organization.address_longitude
      marker.infowindow "<h5><a href='/organizations/#{organization.id}'>#{organization.name}</a></h5><small>#{organization.address_formatted_address}</small>"
    end

    render("organization_templates/index.html.erb")
  end

  def show
    @occupation = Occupation.new
    @assignment = Assignment.new
    @organization = Organization.find(params.fetch("id_to_display"))

    render("organization_templates/show.html.erb")
  end

  def new_form
    @organization = Organization.new

    render("organization_templates/new_form.html.erb")
  end

  def create_row
    @organization = Organization.new

    @organization.name = params.fetch("name")
    @organization.address = params.fetch("address")
    @organization.url = params.fetch("url")
    @organization.user_id = params.fetch("user_id")
    @organization.logo = params.fetch("logo") if params.key?("logo")

    if @organization.valid?
      @organization.save

      redirect_back(:fallback_location => "/organizations", :notice => "Organization created successfully.")
    else
      render("organization_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @organization = Organization.find(params.fetch("prefill_with_id"))

    render("organization_templates/edit_form.html.erb")
  end

  def update_row
    @organization = Organization.find(params.fetch("id_to_modify"))

    @organization.name = params.fetch("name")
    @organization.address = params.fetch("address")
    @organization.url = params.fetch("url")
    @organization.user_id = params.fetch("user_id")
    @organization.logo = params.fetch("logo") if params.key?("logo")

    if @organization.valid?
      @organization.save

      redirect_to("/organizations/#{@organization.id}", :notice => "Organization updated successfully.")
    else
      render("organization_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @organization = Organization.find(params.fetch("id_to_remove"))

    @organization.destroy

    redirect_to("/organizations", :notice => "Organization deleted successfully.")
  end
end
