class TopicsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def index
    @topics = Topic.all
    @topic = Topic.new

  end

  def create
    @topic = Topic.create(topic_params)
    render json: @topic
    # format.js { render "create" }
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
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

  def topic_params
    params.permit(:topic_name)
  end
end
