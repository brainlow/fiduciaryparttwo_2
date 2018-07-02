class BeneficiariesController < ApplicationController
  def index
    @beneficiaries = Beneficiary.all

    render("beneficiaries/index.html.erb")
  end

  def show
    @beneficiary = Beneficiary.find(params[:id])

    render("beneficiaries/show.html.erb")
  end

  def new
    @beneficiary = Beneficiary.new

    render("beneficiaries/new.html.erb")
  end

  def create
    @beneficiary = Beneficiary.new

    @beneficiary.first_name = params[:first_name]
    @beneficiary.last_name = params[:last_name]
    @beneficiary.address = params[:address]
    @beneficiary.matter_id = params[:matter_id]

    save_status = @beneficiary.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/beneficiaries/new", "/create_beneficiary"
        redirect_to("/beneficiaries")
      else
        redirect_back(:fallback_location => "/", :notice => "Beneficiary created successfully.")
      end
    else
      render("beneficiaries/new.html.erb")
    end
  end

  def edit
    @beneficiary = Beneficiary.find(params[:id])

    render("beneficiaries/edit.html.erb")
  end

  def update
    @beneficiary = Beneficiary.find(params[:id])

    @beneficiary.first_name = params[:first_name]
    @beneficiary.last_name = params[:last_name]
    @beneficiary.address = params[:address]
    @beneficiary.matter_id = params[:matter_id]

    save_status = @beneficiary.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/beneficiaries/#{@beneficiary.id}/edit", "/update_beneficiary"
        redirect_to("/beneficiaries/#{@beneficiary.id}", :notice => "Beneficiary updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Beneficiary updated successfully.")
      end
    else
      render("beneficiaries/edit.html.erb")
    end
  end

  def destroy
    @beneficiary = Beneficiary.find(params[:id])

    @beneficiary.destroy

    if URI(request.referer).path == "/beneficiaries/#{@beneficiary.id}"
      redirect_to("/", :notice => "Beneficiary deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Beneficiary deleted.")
    end
  end
end
