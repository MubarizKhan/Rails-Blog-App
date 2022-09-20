# frozen_string_literal: true

module Payment
  class InvoicesController < ApplicationController
    # before_action :authenticate_user!
    # skip_before_action :require_login, only: [:index]

    def index
      @invoices = Invoice.all
      # @invoice = Invoice.new
    end

    def show
      @invoice = Invoice.find(params[:id])
    end

    def new
      @invoice = Invoice.new(invoice_params)
      @invoice.save

      # @invoice.save
    end

    def create
      @invoice = Invoice.new(invoice_params)
      if @invoice.save
        redirect_to root_path
      else
        render :new
      end
    end


    def edit
      @invoice = Invoice.find(params[:id])
    end

    def update
      @invoice = Invoice.find(params[:id])
      if @invoice.update(invoice_params)
        @invoice.save
        # redirect_to root_path
      else
        render :edit
      end
    end


    private

    def invoice_params
      # params.permit(:username, :amount)
      params.require(:invoices).permit(:username, :amount)
    end
  end
end
