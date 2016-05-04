class Store < ActiveRecord::Base
  belongs_to :category
  belongs_to :property
  has_many :sales, dependent: :destroy
  has_many :stores_users
  has_many :users, :through => :stores_users
  # has_and_belongs_to_many :users
  # has_many :users, through: :sales

  validates :name, :number, :floor, :telephone, :email, :category_id, :property_id, presence: true

  def name_with_property
    "#{name}: Local #{self.number} (#{Property.find_by(id: self.id).name})"
  end
end
