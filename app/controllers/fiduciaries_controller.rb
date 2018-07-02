class FiduciariesController < ApplicationController
  def index
    @fiduciaries = Fiduciary.all
    @location_hash = Gmaps4rails.build_markers(@fiduciaries.where.not(:address_latitude => nil)) do |fiduciary, marker|
      marker.lat fiduciary.address_latitude
      marker.lng fiduciary.address_longitude
      marker.infowindow "<h5><a href='/fiduciaries/#{fiduciary.id}'>#{fiduciary.first_name}</a></h5><small>#{fiduciary.address_formatted_address}</small>"
    end

    render("fiduciaries/index.html.erb")
  end

  def show
    @fiduciary = Fiduciary.find(params[:id])

    render("fiduciaries/show.html.erb")
  end

  def new
    @fiduciary = Fiduciary.new

    render("fiduciaries/new.html.erb")
  end

  def create
    @fiduciary = Fiduciary.new

    @fiduciary.first_name = params[:first_name]
    @fiduciary.last_name = params[:last_name]
    @fiduciary.address = params[:address]
    @fiduciary.matter_id = params[:matter_id]

    save_status = @fiduciary.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/fiduciaries/new", "/create_fiduciary"
        redirect_to("/fiduciaries")
      else
        redirect_back(:fallback_location => "/", :notice => "Fiduciary created successfully.")
      end
    else
      render("fiduciaries/new.html.erb")
    end
  end

  def edit
    @fiduciary = Fiduciary.find(params[:id])

    render("fiduciaries/edit.html.erb")
  end

  def update
    @fiduciary = Fiduciary.find(params[:id])

    @fiduciary.first_name = params[:first_name]
    @fiduciary.last_name = params[:last_name]
    @fiduciary.address = params[:address]
    @fiduciary.matter_id = params[:matter_id]

    save_status = @fiduciary.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/fiduciaries/#{@fiduciary.id}/edit", "/update_fiduciary"
        redirect_to("/fiduciaries/#{@fiduciary.id}", :notice => "Fiduciary updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Fiduciary updated successfully.")
      end
    else
      render("fiduciaries/edit.html.erb")
    end
  end

  def destroy
    @fiduciary = Fiduciary.find(params[:id])

    @fiduciary.destroy

    if URI(request.referer).path == "/fiduciaries/#{@fiduciary.id}"
      redirect_to("/", :notice => "Fiduciary deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Fiduciary deleted.")
    end
  end
end
