class Article < ApplicationRecord
  #Relacion de active record con comments y que destuye todos los registros coment si se borra el articulo
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

end
