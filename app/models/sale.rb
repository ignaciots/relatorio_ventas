class Sale < ActiveRecord::Base
  belongs_to :store
  belongs_to :user

  validates_presence_of :store_id, :user_id
end
