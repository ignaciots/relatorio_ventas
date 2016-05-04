class StoresUser < ActiveRecord::Base
  belongs_to :store
  belongs_to :user
end
