class AssetValuesController < ApplicationController
  def index
    @q = AssetValue.ransack(params[:q])
    @asset_values = @q.result(:distinct => true).includes(:asset, :matter).page(params[:page]).per(10)

    render("asset_value_templates/index.html.erb")
  end

  def show
    @asset_value = AssetValue.find(params.fetch("id_to_display"))

    render("asset_value_templates/show.html.erb")
  end

  def new_form
    @asset_value = AssetValue.new

    render("asset_value_templates/new_form.html.erb")
  end

  def create_row
    @asset_value = AssetValue.new

    @asset_value.asset_id = params.fetch("asset_id")
    @asset_value.date = params.fetch("date")
    @asset_value.amount = params.fetch("amount")
    @asset_value.shares = params.fetch("shares")

    if @asset_value.valid?
      @asset_value.save

      redirect_back(:fallback_location => "/asset_values", :notice => "Asset value created successfully.")
    else
      render("asset_value_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_asset
    @asset_value = AssetValue.new

    @asset_value.asset_id = params.fetch("asset_id")
    @asset_value.date = params.fetch("date")
    @asset_value.amount = params.fetch("amount")
    @asset_value.shares = params.fetch("shares")

    if @asset_value.valid?
      @asset_value.save

      redirect_to("/assets/#{@asset_value.asset_id}", notice: "AssetValue created successfully.")
    else
      render("asset_value_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @asset_value = AssetValue.find(params.fetch("prefill_with_id"))

    render("asset_value_templates/edit_form.html.erb")
  end

  def update_row
    @asset_value = AssetValue.find(params.fetch("id_to_modify"))

    @asset_value.asset_id = params.fetch("asset_id")
    @asset_value.date = params.fetch("date")
    @asset_value.amount = params.fetch("amount")
    @asset_value.shares = params.fetch("shares")

    if @asset_value.valid?
      @asset_value.save

      redirect_to("/asset_values/#{@asset_value.id}", :notice => "Asset value updated successfully.")
    else
      render("asset_value_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_asset
    @asset_value = AssetValue.find(params.fetch("id_to_remove"))

    @asset_value.destroy

    redirect_to("/assets/#{@asset_value.asset_id}", notice: "AssetValue deleted successfully.")
  end

  def destroy_row
    @asset_value = AssetValue.find(params.fetch("id_to_remove"))

    @asset_value.destroy

    redirect_to("/asset_values", :notice => "Asset value deleted successfully.")
  end
end
