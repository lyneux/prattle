require_dependency "prattle/application_controller"

module Prattle
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def create
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.create(post_params)

      @post.user = prattle_user
      @post.save

      @topic.last_post_at = @post.created_at
      @topic.save

      posts = Post.where("topic_id = " + @topic.id.to_s).paginate(:page => params[:page], :per_page => 25)
      redirect_to category_forum_topic_path(:category_id => @post.topic.forum.category.id, :id => @post.topic.id, :forum_id => @post.topic.forum.id, :page => posts.total_pages.to_s, :anchor => "post" + @post.topic_position.to_s,  :flash => {:success => "Post created"})
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
