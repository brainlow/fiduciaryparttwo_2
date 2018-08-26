class RelationshipsController < ApplicationController
  before_action :current_user_must_be_relationship_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_relationship_user
    relationship = Relationship.find(params[:id])

    unless current_user == relationship.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.relationships.ransack(params[:q])
    @relationships = @q.result(:distinct => true).includes(:user, :matter, :organization).page(params[:page]).per(10)

    render("relationships/index.html.erb")
  end

  def show
    @relationship = Relationship.find(params[:id])

    render("relationships/show.html.erb")
  end

  def new
    @relationship = Relationship.new

    render("relationships/new.html.erb")
  end

  def create
    @relationship = Relationship.new

    @relationship.user_id = params[:user_id]
    @relationship.role = params[:role]
    @relationship.matter_id = params[:matter_id]
    @relationship.organization_id = params[:organization_id]

    save_status = @relationship.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/relationships/new", "/create_relationship"
        redirect_to("/relationships")
      else
        redirect_back(:fallback_location => "/", :notice => "Relationship created successfully.")
      end
    else
      render("relationships/new.html.erb")
    end
  end

  def edit
    @relationship = Relationship.find(params[:id])

    render("relationships/edit.html.erb")
  end

  def update
    @relationship = Relationship.find(params[:id])
    @relationship.role = params[:role]
    @relationship.matter_id = params[:matter_id]
    @relationship.organization_id = params[:organization_id]

    save_status = @relationship.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/relationships/#{@relationship.id}/edit", "/update_relationship"
        redirect_to("/relationships/#{@relationship.id}", :notice => "Relationship updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Relationship updated successfully.")
      end
    else
      render("relationships/edit.html.erb")
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])

    @relationship.destroy

    if URI(request.referer).path == "/relationships/#{@relationship.id}"
      redirect_to("/", :notice => "Relationship deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Relationship deleted.")
    end
  end
end
