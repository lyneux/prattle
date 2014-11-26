require_dependency "prattle/application_controller"

module Prattle
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def create
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.create(post_params)

      @post.user = prattle_user
      @post.save

      redirect_to [@post.topic.forum.category, @post.topic.forum, @post.topic], :flash => {:success => "Post created"}
      
    end
 
	private

      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

  		def post_params
    		params.require(:post).permit(:text)
  		end
	end
	
end
