require_dependency "prattle/application_controller"

include Prattle::ApplicationHelper
include Prattle::MemberSettingsHelper
include Prattle::NotificationsHelper

module Prattle
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :can_edit?, only: [:edit, :update]
    after_action :update_post_count, only: [:create]
    after_action :send_notifications, only: [:create]

    def new
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.build
      @attachment = Attachment.new
    end

    def create
      if params[:preview]
        @topic = Topic.find(params[:topic_id])
        @post.text = post_params[:text]
        render :new
      else
        @topic = Topic.find(params[:topic_id])
        @post = @topic.posts.create(post_params)

        @post.user = prattle_user
        @post.save

        @topic.last_post_at = @post.created_at
        @topic.save

        posts = Post.where("topic_id = " + @topic.id.to_s).paginate(:page => params[:page], :per_page => 25)
        redirect_to category_forum_topic_path(:category_id => @post.topic.forum.category.id, :id => @post.topic.id, :forum_id => @post.topic.forum.id, :page => posts.total_pages.to_s, :anchor => "post" + @post.topic_position.to_s,  :flash => {:success => "Post created"})
      end
    end

    def edit
      @topic = Topic.find(params[:topic_id])
    end

    def update
      if params[:preview]
        #puts "PREVIEW!!!"        
        #render :preview
        @topic = Topic.find(params[:topic_id])
        @post.text = post_params[:text]
        render :edit
      else

        if @post.update(post_params)
          #redirect_to [@post.topic.forum.category, @post.topic.forum, @post.topic], :flash => {:success => "Post updated"}
          redirect_to category_forum_topic_path(:category_id => @post.topic.forum.category.id, :id => @post.topic.id, :forum_id => @post.topic.forum.id, :page => @post.page, :anchor => "post" + @post.topic_position.to_s,  :flash => {:success => "Post updated"})
        else
          render :edit
        end

      end
    end
 
	private

      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      def can_edit?
        redirect_to category_forum_topic_path(@post.topic.forum.category, @post.topic.forum, @post.topic), :flash => {:danger => "You are not allowed to perform that operation"} unless edit_post?(@post)
      end

  		def post_params
    		params.require(:post).permit(:text, :attachment)
  		end

	end
	
end
