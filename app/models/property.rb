class Property < ActiveRecord::Base
  has_many :stores
  # has_many :categories, through: :stores
  validates_presence_of :name
  validates_presence_of :address
  validates :name, uniqueness: { case_sensitive: false, message: "El nombre del centro comercial ya existe" }

  def ubicacion
    address
  end
end
