class AssetsController < ApplicationController
  def index
    @q = Asset.ransack(params[:q])
    @assets = @q.result(:distinct => true).includes(:matter, :transactions, :asset_values).page(params[:page]).per(10)

    render("asset_templates/index.html.erb")
  end

  def show
    @asset_value = AssetValue.new
    @transaction = Transaction.new
    @asset = Asset.find(params.fetch("id_to_display"))

    render("asset_templates/show.html.erb")
  end

  def new_form
    @asset = Asset.new

    render("asset_templates/new_form.html.erb")
  end

  def create_row
    @asset = Asset.new

    @asset.matter_id = params.fetch("matter_id")
    @asset.description = params.fetch("description")
    @asset.asset_type = params.fetch("asset_type")
    @asset.ticker = params.fetch("ticker")
    @asset.account_number = params.fetch("account_number")
    @asset.institution = params.fetch("institution")
    @asset.account_type = params.fetch("account_type")

    if @asset.valid?
      @asset.save

      redirect_back(:fallback_location => "/assets", :notice => "Asset created successfully.")
    else
      render("asset_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_matter
    @asset = Asset.new

    @asset.matter_id = params.fetch("matter_id")
    @asset.description = params.fetch("description")
    @asset.asset_type = params.fetch("asset_type")
    @asset.ticker = params.fetch("ticker")
    @asset.account_number = params.fetch("account_number")
    @asset.institution = params.fetch("institution")
    @asset.account_type = params.fetch("account_type")

    if @asset.valid?
      @asset.save

      redirect_to("/matters/#{@asset.matter_id}", notice: "Asset created successfully.")
    else
      render("asset_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @asset = Asset.find(params.fetch("prefill_with_id"))

    render("asset_templates/edit_form.html.erb")
  end

  def update_row
    @asset = Asset.find(params.fetch("id_to_modify"))

    @asset.matter_id = params.fetch("matter_id")
    @asset.description = params.fetch("description")
    @asset.asset_type = params.fetch("asset_type")
    @asset.ticker = params.fetch("ticker")
    @asset.account_number = params.fetch("account_number")
    @asset.institution = params.fetch("institution")
    @asset.account_type = params.fetch("account_type")

    if @asset.valid?
      @asset.save

      redirect_to("/assets/#{@asset.id}", :notice => "Asset updated successfully.")
    else
      render("asset_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_matter
    @asset = Asset.find(params.fetch("id_to_remove"))

    @asset.destroy

    redirect_to("/matters/#{@asset.matter_id}", notice: "Asset deleted successfully.")
  end

  def destroy_row
    @asset = Asset.find(params.fetch("id_to_remove"))

    @asset.destroy

    redirect_to("/assets", :notice => "Asset deleted successfully.")
  end
end
