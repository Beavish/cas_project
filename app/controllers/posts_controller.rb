class PostsController < ApplicationController
before_action :authenticate_user! ,only:[ :index,:new, :edit, :update, :destroy]
before_action :authenticate_admin!, only:[:new, :edit, :update, :destroy]
before_action :set_post, only: [:show, :edit, :update, :destroy]
def authenticate_admin!
  if user_signed_in?
  # check if current user is admin
  unless current_user.journalist? 
    # if current_user is not journalist redirect to some route
    redirect_to '/'
  end
end
  # if current_user is journalis he will proceed to edit action
end
 

  # GET /posts
  # GET /posts.json
  def index
    if user_signed_in?
    @id = current_user.id
    @posts =Post.where(user_id:@id)
    else
      redirect_to '/'
    end
    end

  # GET /posts/1
  # GET /posts/1.json
  def show 
    if user_signed_in? 
    @id = current_user.id
    @post = Post.find(params[:id])
    @user = User.find(@id)
    ## if user isn't the current user and the post is false redirect to whatever
    if (@post.user_id != @id)&&(@post.public === false)
      redirect_to "/"
    end 
    ## if the reader doesn't have a premium subscription redirect 
    @subscription = @user.subsId 
    if (@subscription.nil?)&&(@post.premium ===true)
      redirect_to "/checkouts/new"
    end

    else
      @post = Post.find(params[:id])
     
      if(@post.public == true)&&(@post.premium == false)
      p 'no user signed in'
      else
        redirect_to "/checkouts/new"
      end
    end
  end


  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title,:body, :public, :Genre, :premium,:description)
    end
end
