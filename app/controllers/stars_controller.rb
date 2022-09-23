# frozen_string_literal: true

class StarsController < ApplicationController
  before_action :authenticate_user!

  # def new
  #   @star = @starable.star.new

  def create
    @star = current_user.stars.new(star_params)

    # @star.user_id = current_user.id
    @star.starable_type
    redirect_to root_path unless @star.save
  end

  def destroy
    @star = current_user.stars.find(params[:id])
    @starable = @star.starable
    @star.destroy
  end

  # byebug

  private

  def star_params
    params.require(:star).permit(:starable_id, :starable_type)
  end
end
