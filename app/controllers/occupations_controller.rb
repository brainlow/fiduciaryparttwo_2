class OccupationsController < ApplicationController
  def index
    @q = Occupation.ransack(params[:q])
    @occupations = @q.result(:distinct => true).includes(:user, :organization).page(params[:page]).per(10)

    render("occupation_templates/index.html.erb")
  end

  def show
    @occupation = Occupation.find(params.fetch("id_to_display"))

    render("occupation_templates/show.html.erb")
  end

  def new_form
    @occupation = Occupation.new

    render("occupation_templates/new_form.html.erb")
  end

  def create_row
    @occupation = Occupation.new

    @occupation.user_id = params.fetch("user_id")
    @occupation.organization_id = params.fetch("organization_id")
    @occupation.role = params.fetch("role")

    if @occupation.valid?
      @occupation.save

      redirect_back(:fallback_location => "/occupations", :notice => "Occupation created successfully.")
    else
      render("occupation_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_organization
    @occupation = Occupation.new

    @occupation.user_id = params.fetch("user_id")
    @occupation.organization_id = params.fetch("organization_id")
    @occupation.role = params.fetch("role")

    if @occupation.valid?
      @occupation.save

      redirect_to("/organizations/#{@occupation.organization_id}", notice: "Occupation created successfully.")
    else
      render("occupation_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @occupation = Occupation.find(params.fetch("prefill_with_id"))

    render("occupation_templates/edit_form.html.erb")
  end

  def update_row
    @occupation = Occupation.find(params.fetch("id_to_modify"))

    @occupation.user_id = params.fetch("user_id")
    @occupation.organization_id = params.fetch("organization_id")
    @occupation.role = params.fetch("role")

    if @occupation.valid?
      @occupation.save

      redirect_to("/occupations/#{@occupation.id}", :notice => "Occupation updated successfully.")
    else
      render("occupation_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @occupation = Occupation.find(params.fetch("id_to_remove"))

    @occupation.destroy

    redirect_to("/users/#{@occupation.user_id}", notice: "Occupation deleted successfully.")
  end

  def destroy_row_from_organization
    @occupation = Occupation.find(params.fetch("id_to_remove"))

    @occupation.destroy

    redirect_to("/organizations/#{@occupation.organization_id}", notice: "Occupation deleted successfully.")
  end

  def destroy_row
    @occupation = Occupation.find(params.fetch("id_to_remove"))

    @occupation.destroy

    redirect_to("/occupations", :notice => "Occupation deleted successfully.")
  end
end
