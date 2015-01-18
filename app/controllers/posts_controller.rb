class PostsController < ApplicationController


  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comments = @post.comments

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
    @topic.posts << @post
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
    # authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    #nog aanpassen aan de hand van 29.

    if @post.update_attributes(params.require(:post).permit(:title, :body, ))
      flash[:notice] = "Post was updated"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error updating the post. Please try again."
      render :edit
    end

  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    title = @post.title



    if @post.destroy
      flash[:notice] = "\"#{title}\ was deleted"
      redirect_to @topic
    else
      flash[:error] = "Error"
      render :show
    end
  end

end
