class MattersController < ApplicationController
  def index
    @q = Matter.ransack(params[:q])
    @matters = @q.result(:distinct => true).includes(:assets, :relationship, :transactions).page(params[:page]).per(10)

    render("matters/index.html.erb")
  end

  def show
    @asset = Asset.new
    @matter = Matter.find(params[:id])

    render("matters/show.html.erb")
  end

  def new
    @matter = Matter.new

    render("matters/new.html.erb")
  end

  def create
    @matter = Matter.new

    @matter.matter_type = params[:matter_type]
    @matter.matter_name = params[:matter_name]
    @matter.matter_number = params[:matter_number]
    @matter.matter_state = params[:matter_state]
    @matter.matter_county = params[:matter_county]

    save_status = @matter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/matters/new", "/create_matter"
        redirect_to("/matters")
      else
        redirect_back(:fallback_location => "/", :notice => "Matter created successfully.")
      end
    else
      render("matters/new.html.erb")
    end
  end

  def edit
    @matter = Matter.find(params[:id])

    render("matters/edit.html.erb")
  end

  def update
    @matter = Matter.find(params[:id])

    @matter.matter_type = params[:matter_type]
    @matter.matter_name = params[:matter_name]
    @matter.matter_number = params[:matter_number]
    @matter.matter_state = params[:matter_state]
    @matter.matter_county = params[:matter_county]

    save_status = @matter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/matters/#{@matter.id}/edit", "/update_matter"
        redirect_to("/matters/#{@matter.id}", :notice => "Matter updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Matter updated successfully.")
      end
    else
      render("matters/edit.html.erb")
    end
  end

  def destroy
    @matter = Matter.find(params[:id])

    @matter.destroy

    if URI(request.referer).path == "/matters/#{@matter.id}"
      redirect_to("/", :notice => "Matter deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Matter deleted.")
    end
  end
end
