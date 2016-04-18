class Store < ActiveRecord::Base
  belongs_to :category
  belongs_to :property
  has_many :users
  has_many :sales, dependent: :destroy

  validates :name, :number, :floor, :telephone, :email, :category_id, presence: true

  def name_with_property
    "#{name}: Local #{self.number} (#{Property.find_by(id: self.id).name})"
  end
end
