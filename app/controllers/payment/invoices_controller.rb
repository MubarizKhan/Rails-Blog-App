class Payment::InvoicesController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :require_login, only: [:index]

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to @invoice
    else
      render :new
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:username, :amount)
  end

end
