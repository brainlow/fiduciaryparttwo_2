class BeneficiariesController < ApplicationController
  def index
    @beneficiaries = Beneficiary.all
    @location_hash = Gmaps4rails.build_markers(@beneficiaries.where.not(:address_latitude => nil)) do |beneficiary, marker|
      marker.lat beneficiary.address_latitude
      marker.lng beneficiary.address_longitude
      marker.infowindow "<h5><a href='/beneficiaries/#{beneficiary.id}'>#{beneficiary.first_name}</a></h5><small>#{beneficiary.address_formatted_address}</small>"
    end

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
