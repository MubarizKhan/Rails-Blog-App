class TopicsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def index
    @topics = Topic.all
    @topic = Topic.new

  end

  def create
    @topic = Topic.new#(topic_params)
    @topic.save
    render json: @topic
    # format.js { render "create" }
  end

  def new
    @topic = Topic.new#(topic_params)
  end

  def show
    @topic = Topic.find(params[:id])
    redirect_to index
  end

  private

  def topic_params
    params.require(:topic).permit(:topic_name)
  end
end
