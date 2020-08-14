class ContentController < ApplicationController

  def world
    # get all posts where genre = ^ and public = true
    @posts = Post.where(Genre:'World',public:true)
  end

  def politics
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'Politics',public:true)

  end

  def sport
      # this condition selects all from the post where Sport is the Genre and Public is true 
      # SELECT "posts".* FROM "posts" WHERE "posts"."Genre" = ? AND "posts"."Public" = ?  [["Genre", "Sport"], ["Public", 1]]
      @posts = Post.where(Genre:'Sport',public:true)
      
  end

  def design
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'Design',public:true)

  end

  def culture
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'Culture',public:true)

  end

  def business
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'Business',public:true)

  end

  def travel
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'Travel',public:true)

  end

  def science
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'Science',public:true)

  end

  def opinion
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'Opinion',public:true)
  end

  def technology
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'Technology',public:true)
  end

  def health
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'Health',public:true)
  end

  def weather
      @app = WeatherStation.new('weather')
      @app.run
      @response = @app.getInfo
      p "THIS IS THE CONTROLLER ************************************************************************************"
      p @response
      
      
    end
  
end
