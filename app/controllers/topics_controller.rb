# frozen_string_literal: true

class TopicsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def index
    # @topics = Topic.all
    @topic = Topic.new
    @t1 = Topic.where(topic_name: '2nd')
    @t2 = Topic.pluck(:topic_name)

    @topics = if params[:after_updation] == 'Topic Status Updated!'
                Topic.after_updation.all
              else
                Topic.all
              end
    # end
  end

  def create
    @topic = Topic.create(cr_topic_params)
    render json: @topic
    # format.js { render "create" }
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(up_topic_params)
      redirect_to root_path
      # byebug
    else
      render :edit
    end
  end

  def new
    @topic = Topic.new(topic_params)
  end

  def show
    @topic = Topic.find(params[:id])
    redirect_to index
  end

  private

  def cr_topic_params
    params.permit(:topic_name)
    # params.require(:topic).permit(:topic_name)
  end

  def up_topic_params
    params.require(:topic).permit(:topic_name)
  end
end
