class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :sales
  has_many :stores_users
  has_many :stores, :through => :stores_users
  validates_presence_of :name, :email
  validates :email, uniqueness: { case_sensitive: false, message: "El correo electrónico ya existe" }
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "vendedor" if self.role.nil?
  end

  def store_with_property
    "#{self.store.name} local #{self.store.number} (#{Property.find_by(id: self.store.property_id).name})"
  end

  def has_stores?
    if self.stores.any?
      true
    else
      false
    end
  end

  def administrador?
    self.role.name == "administrador"
  end

  def vendedor?
    self.role.name == "vendedor"
  end

  def supervisor?
    self.role.name == "supervisor"
  end
end
