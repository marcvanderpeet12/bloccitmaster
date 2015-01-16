class PostsController < ApplicationController


  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    #er wordt gecheckt of aan de voorwaarden van policy/new wordt voldaan => is user.present?
    authorize @post
  end

  #Als je geen create functie aanmaakt kun je het form niet submitten.
  def create
    #What values are permitted and required?
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    #wat bedoelen ze hiermee?
    # @post.topic
    authorize @post
    if @post.save

      flash[:notice] = "Post was saved."
      #@post = post/1 bijvoorbeeld
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    #nog aanpassen aan de hand van 29.
  end

end
