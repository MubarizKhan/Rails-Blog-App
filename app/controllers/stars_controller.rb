# frozen_string_literal: true

class StarsController < ApplicationController
  before_action :authenticate_user!

  # def new
  #   @star = @starable.star.new

  def create
    @star = current_user.stars.new(star_params)
    # @star = current_user.stars.find_or_create_by(starable_id: starable.id, starable_type: starable.class.to_s).first_or_create

    # @star.user_id = current_user.id
    @star.starable_type
    @star.save
    redirect_to root_path
    # redirect_to @star.starable # unless @star.save
  end

  def destroy
    @star = current_user.stars.find(params[:id])
    @starable = @star.starable
    @star.destroy
    redirect_to root_path
  end

  # byebug

  private

  def star_params
    params.require(:star).permit(:starable_id, :starable_type)
  end
end
