class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new
    @post.strain_name = params[:post] [:strain_name]
    @post.image.attach(params[:post] [:image])
    @post.description = params[:post] [:description]
    @post.price = params[:post] [:price]
    @post.category = params[:post] [:category]
    @post.city = params[:post] [:city]
    @post.phone = params[:post] [:phone]
    @post.email = params[:post] [:email]
    
    if @post.save
      flash[:notice] = "Post was saved successfully"
      redirect_to @post
    else
      flash.now[:alert] = "There was a problem saving the post. Please try again."
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
  @post = Post.find(params[:id])
  @post.strain_name = params[:post] [:strain_name]
  @post.image.attach(params[:post] [:image])
  @post.description = params[:post] [:description]
  @post.price = params[:post] [:price]
  @post.category = params[:post] [:category]
  @post.city = params[:post] [:city]
  @post.phone = params[:post] [:phone]
  @post.email = params[:post] [:email]
  
  if @post.save
       flash[:notice] = "Post was updated successfully."
       redirect_to @post
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
  end
  end
  
  def destroy
    @post = Post.find(params[:id])

     if @post.destroy
       flash[:notice] = "\"#{@post.strain_name}\" was deleted successfully."
       redirect_to posts_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
  end
  
  def post_params
    params.require(:post).permit(:strain_name, :image, :description, :price, :category, :city, :phone, :email)
  end
  
end
