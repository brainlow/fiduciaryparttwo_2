class MattersController < ApplicationController
  before_action :current_user_must_be_matter_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_matter_user
    matter = Matter.find(params[:id])

    unless current_user == matter.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @matters = current_user.matters.page(params[:page]).per(10)

    render("matters/index.html.erb")
  end

  def show
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
    @matter.user_id = params[:user_id]
    @matter.state = params[:state]
    @matter.county = params[:county]

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
    @matter.user_id = params[:user_id]
    @matter.state = params[:state]
    @matter.county = params[:county]

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
