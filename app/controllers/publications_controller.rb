class PublicationsController < ApplicationController

	def index
		@publications = Publication.all.order('created_at DESC') #Для отображения всех публикация от новой к старой на главной странице
	end
	
	def new
	end

	def create
		@publication = Publication.new(publication_params) #Создание и сохранение публикации со странички NEW
		@publication.save

		redirect_to @publication
	end

	def show
		@publication = Publication.find(params[:id]) #Просмотр созданой публикации
	end

private
	def publication_params
		params.require(:publication).permit(:title, :body) #Статические параметры, которые проверяются при создании
	end	
end
