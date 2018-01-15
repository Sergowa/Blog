class Publication < ApplicationRecord
	
	#Проверка на заполненость Заголовка и самого тела публикации
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true
end
