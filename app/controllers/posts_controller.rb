class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    if !current_user
      redirect_to new_user_session_path, :notice => 'Please login to create new posts' and return
      #redirect_to account_url and return
    end

    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = current_user.posts.new(params[:post])

    if @post.save
        redirect_to(@post, :notice => 'Post was successfully created.')
    else
        render :action => "new" 
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
        redirect_to(@post, :notice => 'Post was successfully updated.')
    else
        render :action => "edit"
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to(posts_url)
  end
end
