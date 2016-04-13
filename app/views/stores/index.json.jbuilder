json.array!(@stores) do |store|
  json.extract! store, :id, :name, :number, :floor, :category, :telephone, :email
  json.url store_url(store, format: :json)
end
