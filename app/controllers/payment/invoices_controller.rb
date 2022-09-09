class Payment::InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @invoices = Invoice.all
  end


end
