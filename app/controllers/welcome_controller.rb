class WelcomeController < ApplicationController
  def index
    @postArr = []
    @postArr.clear

    posts = Post.where(public:true)

    posts.each do |post|
        @postArr << post
    end
    p @postArr[0].body.embeds.find{|embeds| embeds.image?}
    
  end

end
