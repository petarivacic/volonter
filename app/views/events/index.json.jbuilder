json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :location, :description, :category, :priority, :tag
  json.url event_url(event, format: :json)
end
