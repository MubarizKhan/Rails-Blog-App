class StarsController < ApplicationController
  before_action :authenticate_user!

  # def new
  #   @star = @starable.star.new

  def create
    @star = current_user.stars.new(star_params)

    # @star.user_id = current_user.id
    if !@star.save
      redirect_to root_path
    end
    redirect_to @star.starable
    # byebug
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
