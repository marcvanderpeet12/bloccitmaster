class CommentsController < ApplicationController
  def create
    
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    #hiermee pak je dus posts/150 in http://localhost:3000/posts/150
    #hiermee voeg je hem toe aan de comments in post.
    @post.comments << @comment  

    if @comment.save
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      #hiermee render je hem naar de nieuwe site!
      #maar hoe ga ik nu terug naar @post?
      # render ':topic/post'
       redirect_to [@post.topic, @post]
      # redirect to something
    end
  end

  def destroy
    
    @post  = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      #zie dat hij hier beide naar dezelfde route terug direct@!
      redirect_to [@topic, @post],  notice: "The comment was deleted."
    else
      flash[:error] = "Error"
      redirect_to [@topic, @post]
    end
  end
end
