class Payment::InvoicesController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :require_login, only: [:index]

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end


  private

  def invoice_params
    params.require(:invoice).permit(:username, :amount)
  end

end
