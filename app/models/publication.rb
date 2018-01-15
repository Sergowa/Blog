class Publication < ApplicationRecord
	#Объявляем, что коменты пренадлежат публикациям и при удалении публикации удалятся коменты
	has_many :comments, dependent: :destroy
	#Проверка на заполненость Заголовка и самого тела публикации
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true
end
