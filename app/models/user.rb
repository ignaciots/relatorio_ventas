class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  belongs_to :store
  has_many :sales
  validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "regular" if self.role.nil?
  end

  def store_with_property
    "#{self.store.name} local #{self.store.number} (#{Property.find_by(id: self.store.property_id).name})"
  end

  def has_store?
    if self.store.present?
      true
    else
      false
    end
  end

  def admin?
    self.role.name == "admin"
  end

  def seller?
    self.role.name == "seller"
  end

  def regular?
    self.role.name == "regular"
  end
end
