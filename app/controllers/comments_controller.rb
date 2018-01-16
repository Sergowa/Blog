class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@publication = Publication.find(params[:publication_id])
		@comment = @publication.comments.create(params[:comment].permit(:name, :body))

		redirect_to publication_path(@publication)
	end	

	def destroy
		@publication = Publication.find(params[:publication_id])
		@comment = @publication.comments.find(params[:id])
		@comment.destroy

		redirect_to publication_path(@publication)
	end	
end
