class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource params_method: :my_sanitizer
  load_and_authorize_resource :through => :current_user
  
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
    @post = Post.new(post_params)
    @post.user = current_user
    
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
    authorize! :update, @post
    @post = Post.find(params[:id])
    
    if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated successfully."
       redirect_to @post
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
  end
  end
  
  def destroy
    authorize! :destroy, @post
    @post = Post.find(params[:id])

     if @post.destroy
       flash[:notice] = "\"#{@post.strain_name}\" was deleted successfully."
       redirect_to posts_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
  end
  
   private
  
  def post_params
    params.require(:post).permit(:strain_name, :image, :description, :price, :category, :contact_name, :city, :phone, :email, :user)
  end
  
  def my_sanitizer 
    params.require(:post).permit(:strain_name, :image, :description, :price, :category, :contact_name, :city, :phone, :email, :user)
  end
  
end
