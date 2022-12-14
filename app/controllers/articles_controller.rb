# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
    @t3 = Article.joins(:comments).group('article_id').count

    # Article.where(id: 1).or(Article.where(id:2))
    # Article.order(created_at: :desc)
    # Article.select(:title)
    # Article.select(:title).distinct
    # Article.limit(1)
    # Article.group(:title).count
  end

  def show
    @article = Article.find(params[:id])
  end

  # The new action instantiates a new article, but does not save it.
  # This article will be used in the view when building the form.
  # By default, the new action will render app/views/articles/new.html.erb,
  # which we will create next.

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # The create action instantiates a new article with values for the title and body, and attempts to save it.
  #  If the article is saved successfully, the action redirects the browser to the article's page at
  #  "http://localhost:3000/articles/#{@article.id}". Else, the action redisplays the form by rendering app/views/articles/new.html.erb.
  #  The title and body here are dummy values. After we create the form, we will come back and change these.

  def create
    # @article.paragraph.name =  ">"
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # redirect_to will cause the browser to make a new request, whereas render renders the specified view for the current request.
  # It is important to use redirect_to after mutating the database or application state.
  # Otherwise, if the user refreshes the page, the browser will make the same request, and the mutation will be repeated.

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    @article.destroy if @article.present?
    redirect_to root_path
  end
  # Using Strong Parameters

  # def archive; end

  # def like
  #   @article = Article.all.find(params[:id])
  #   # @currentUser = current_user.id
  #   # @current_user ||= User.find_by(id: session[:user_id])
  #   # @user = User.find(params[:id])
  #   # @user = current_user.time_sheets
  #   Like.create(article_id: @article.id, user_id: current_user.id)

  # render :show
  # redirect_to article_path(@article)

  # end

  private

  # Submitted form data is put into the params Hash, alongside captured route parameters.
  # Thus, the create action can access the submitted title via params[:article][:title] and the submitted body via params[:article][:body].
  #  We could pass these values individually to Article.new, but that would be verbose and possibly error-prone.
  # And it would become worse as we add more fields.

  # Instead, we will pass a single Hash that contains the values.
  # However, we must still specify what values are allowed in that Hash.
  # Otherwise, a malicious user could potentially submit extra form fields and overwrite private data.
  # In fact, if we pass the unfiltered params[:article] Hash directly to Article.new,
  # Rails will raise a ForbiddenAttributesError to alert us about the problem.
  # So we will use a feature of Rails called Strong Parameters to filter params. Think of it as strong typing for params.

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
# end
