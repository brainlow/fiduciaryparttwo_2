class AssignmentsController < ApplicationController
  before_action :current_user_must_be_assignment_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_assignment_user
    assignment = Assignment.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == assignment.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Assignment.ransack(params[:q])
    @assignments = @q.result(:distinct => true).includes(:user, :matter, :organization).page(params[:page]).per(10)

    render("assignment_templates/index.html.erb")
  end

  def show
    @assignment = Assignment.find(params.fetch("id_to_display"))

    render("assignment_templates/show.html.erb")
  end

  def new_form
    @assignment = Assignment.new

    render("assignment_templates/new_form.html.erb")
  end

  def create_row
    @assignment = Assignment.new

    @assignment.role = params.fetch("role")
    @assignment.user_id = params.fetch("user_id")
    @assignment.matter_id = params.fetch("matter_id")
    @assignment.organization_id = params.fetch("organization_id")

    if @assignment.valid?
      @assignment.save

      redirect_back(:fallback_location => "/assignments", :notice => "Assignment created successfully.")
    else
      render("assignment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_matter
    @assignment = Assignment.new

    @assignment.role = params.fetch("role")
    @assignment.user_id = params.fetch("user_id")
    @assignment.matter_id = params.fetch("matter_id")
    @assignment.organization_id = params.fetch("organization_id")

    if @assignment.valid?
      @assignment.save

      redirect_to("/matters/#{@assignment.matter_id}", notice: "Assignment created successfully.")
    else
      render("assignment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_organization
    @assignment = Assignment.new

    @assignment.role = params.fetch("role")
    @assignment.user_id = params.fetch("user_id")
    @assignment.matter_id = params.fetch("matter_id")
    @assignment.organization_id = params.fetch("organization_id")

    if @assignment.valid?
      @assignment.save

      redirect_to("/organizations/#{@assignment.organization_id}", notice: "Assignment created successfully.")
    else
      render("assignment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @assignment = Assignment.find(params.fetch("prefill_with_id"))

    render("assignment_templates/edit_form.html.erb")
  end

  def update_row
    @assignment = Assignment.find(params.fetch("id_to_modify"))

    @assignment.role = params.fetch("role")
    
    @assignment.matter_id = params.fetch("matter_id")
    @assignment.organization_id = params.fetch("organization_id")

    if @assignment.valid?
      @assignment.save

      redirect_to("/assignments/#{@assignment.id}", :notice => "Assignment updated successfully.")
    else
      render("assignment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @assignment = Assignment.find(params.fetch("id_to_remove"))

    @assignment.destroy

    redirect_to("/users/#{@assignment.user_id}", notice: "Assignment deleted successfully.")
  end

  def destroy_row_from_matter
    @assignment = Assignment.find(params.fetch("id_to_remove"))

    @assignment.destroy

    redirect_to("/matters/#{@assignment.matter_id}", notice: "Assignment deleted successfully.")
  end

  def destroy_row_from_organization
    @assignment = Assignment.find(params.fetch("id_to_remove"))

    @assignment.destroy

    redirect_to("/organizations/#{@assignment.organization_id}", notice: "Assignment deleted successfully.")
  end

  def destroy_row
    @assignment = Assignment.find(params.fetch("id_to_remove"))

    @assignment.destroy

    redirect_to("/assignments", :notice => "Assignment deleted successfully.")
  end
end
