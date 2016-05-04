class Category < ActiveRecord::Base
  has_many :stores
  # has_many :properties, through: :stores
  validates_presence_of :name
  validates :name, uniqueness: { case_sensitive: false, message: "El nombre del rubro ya existe" }
end
