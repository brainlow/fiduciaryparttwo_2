class MattersController < ApplicationController
  def index
    @q = Matter.ransack(params[:q])
    @matters = @q.result(:distinct => true).includes(:assets, :matter_joins, :organizations, :asset_values, :transactions, :users).page(params[:page]).per(10)

    render("matter_templates/index.html.erb")
  end

  def show
    @assignment = Assignment.new
    @asset = Asset.new
    @matter = Matter.find(params.fetch("id_to_display"))

    render("matter_templates/show.html.erb")
  end

  def new_form
    @matter = Matter.new

    render("matter_templates/new_form.html.erb")
  end

  def create_row
    @matter = Matter.new

    @matter.matter_type = params.fetch("matter_type")
    @matter.matter_name = params.fetch("matter_name")
    @matter.matter_number = params.fetch("matter_number")
    @matter.matter_state = params.fetch("matter_state")
    @matter.matter_county = params.fetch("matter_county")

    if @matter.valid?
      @matter.save

      redirect_back(:fallback_location => "/matters", :notice => "Matter created successfully.")
    else
      render("matter_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @matter = Matter.find(params.fetch("prefill_with_id"))

    render("matter_templates/edit_form.html.erb")
  end

  def update_row
    @matter = Matter.find(params.fetch("id_to_modify"))

    @matter.matter_type = params.fetch("matter_type")
    @matter.matter_name = params.fetch("matter_name")
    @matter.matter_number = params.fetch("matter_number")
    @matter.matter_state = params.fetch("matter_state")
    @matter.matter_county = params.fetch("matter_county")

    if @matter.valid?
      @matter.save

      redirect_to("/matters/#{@matter.id}", :notice => "Matter updated successfully.")
    else
      render("matter_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @matter = Matter.find(params.fetch("id_to_remove"))

    @matter.destroy

    redirect_to("/matters", :notice => "Matter deleted successfully.")
  end
end
