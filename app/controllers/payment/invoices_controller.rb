class Payment::InvoicesController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :require_login, only: [:index]

  def index
    @invoices = Invoice.all
  end


end
