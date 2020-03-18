class GossipsController < ApplicationController
	def new
		@gossip = Gossip.new
		@user_number = User.all.count
	end

	def create
		param = params[:gossip]
		if param[:title] != "" && param[:content] != "" && param[:user_id] != ""
			new_gossip = accepte
			Gossip.create(new_gossip)
			redirect_to(gossips_path)

		else
			redirect_to(new_gossip_path)
		end
	end

	def index
		@gossips = Gossip.all	
	end

	def show
		@gossip = Gossip.find(params[:id].to_i)
		@Comment = Comment.new
		@user_number = User.all.count
	end

	def edit
		@gossip = Gossip.find(params[:id].to_i)
		@user_number = User.all.count
	end

	def update
		param = params[:gossip]
		@gossip = Gossip.find(params[:id].to_i)
		if param[:title] != "" && param[:content] != "" && param[:user_id] != ""
			edit_gossip = accepte
			@gossip.update(edit_gossip)
			redirect_to(gossips_path)
		else
			redirect_to(edit_gossip_path(@gossip.id))
		end
	end

	def destroy
		@gossip = Gossip.find(params[:id].to_i)
		@gossip.delete
		redirect_to(gossips_path)
	end

private

def accepte
	params.require(:gossip).permit(:title, :content, :user_id)
end
end
