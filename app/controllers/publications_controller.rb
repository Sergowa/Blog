class PublicationsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show] #Для того чтобы незарегистрированный пользователь не мог ничего делать 


	def index
		@publications = Publication.all.order('created_at DESC') #Для отображения всех публикация от новой к старой на главной странице
	end
	
	def new
		@publication = current_user.publications.build #Создание привязки публикации к id юзеру
		#@publication = Publication.new #Cоздали при проверке заполнености и условие при сохранении в методе create
	end

	def create
		#@publication = Publication.new(publication_params) #Создание и сохранение публикации со странички NEW
		@publication = current_user.publications.build(publication_params) #Создание привязки публикации к id юзеру
		if @publication.save
			redirect_to @publication
		else
			render 'new'	
		end
	end

	def show
		@publication = Publication.find(params[:id]) #Просмотр созданой публикации
	end

	def edit
		@publication = Publication.find(params[:id]) 
	end	

	def update
		@publication = Publication.find(params[:id])

		if @publication.update(params[:publication].permit(:title, :body))
			redirect_to @publication
		else
			render 'edit'
		end		
	end	

	def destroy
		@publication = Publication.find(params[:id])
		@publication.destroy

		redirect_to root_path
	end	

private
	def publication_params
		params.require(:publication).permit(:title, :body) #Статические параметры, которые проверяются при создании
	end	
end
