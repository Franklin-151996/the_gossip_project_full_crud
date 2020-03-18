class CommentsController < ApplicationController
	def create
		Comment.create(content: params[:content], user_id: params[:user_id].to_i, gossip_id: params[:gossip_id].to_i)
		redirect_to(gossip_path(params[:gossip_id]))
	end

	def destroy
		Comment.find(params[:id]).delete
		redirect_to(gossip_path(params[:gossip_id]))
	end

	def edit
		@comment = Comment.find(params[:id].to_i)
		@user_number = User.all.count
		@gossip = Gossip.find(params[:gossip_id])
	end

	def update
		comment = Comment.find(params[:id])
		param_comment = params[:comment]

		comment.content = param_comment[:content]
		comment.user_id = param_comment[:user_id]
		comment.gossip_id = param_comment[:gossip_id]
		comment.save
		redirect_to(gossip_path(param_comment[:gossip_id]))
	end
end
