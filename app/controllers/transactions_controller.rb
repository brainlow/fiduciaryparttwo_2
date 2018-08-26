class TransactionsController < ApplicationController
  def index
    @q = Transaction.ransack(params[:q])
    @transactions = @q.result(:distinct => true).includes(:asset, :matter).page(params[:page]).per(10)

    render("transactions/index.html.erb")
  end

  def show
    @transaction = Transaction.find(params[:id])

    render("transactions/show.html.erb")
  end

  def new
    @transaction = Transaction.new

    render("transactions/new.html.erb")
  end

  def create
    @transaction = Transaction.new

    @transaction.asset_id = params[:asset_id]
    @transaction.shares = params[:shares]
    @transaction.date = params[:date]
    @transaction.amount = params[:amount]
    @transaction.category = params[:category]
    @transaction.description = params[:description]
    @transaction.payee = params[:payee]
    @transaction.distribution = params[:distribution]

    save_status = @transaction.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/transactions/new", "/create_transaction"
        redirect_to("/transactions")
      else
        redirect_back(:fallback_location => "/", :notice => "Transaction created successfully.")
      end
    else
      render("transactions/new.html.erb")
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])

    render("transactions/edit.html.erb")
  end

  def update
    @transaction = Transaction.find(params[:id])

    @transaction.asset_id = params[:asset_id]
    @transaction.shares = params[:shares]
    @transaction.date = params[:date]
    @transaction.amount = params[:amount]
    @transaction.category = params[:category]
    @transaction.description = params[:description]
    @transaction.payee = params[:payee]
    @transaction.distribution = params[:distribution]

    save_status = @transaction.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/transactions/#{@transaction.id}/edit", "/update_transaction"
        redirect_to("/transactions/#{@transaction.id}", :notice => "Transaction updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Transaction updated successfully.")
      end
    else
      render("transactions/edit.html.erb")
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])

    @transaction.destroy

    if URI(request.referer).path == "/transactions/#{@transaction.id}"
      redirect_to("/", :notice => "Transaction deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Transaction deleted.")
    end
  end
end
