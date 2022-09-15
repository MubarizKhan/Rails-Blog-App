class TopicsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def index
    @topics = Topic.all
    @topic = Topic.new#(topic_params)
  end

  def create
    @topic = Topic.new#(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_path, notice: 'Topic was successfully created.' }
        # format.js {render layout: false}
        format.json { head :no_content }
        # format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        # format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def new
    @topic = Topic.new#(topic_params)
  end

  def show
    @article = Topic.find(params[:id])
    redirect_to index
  end

  private

  def topic_params
    params.require(:topic).permit(:topic_name)
  end

end
