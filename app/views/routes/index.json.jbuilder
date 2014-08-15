json.array!(@routes) do |route|
  json.extract! route, :id, :name, :colour, :stripe
  json.url route_url(route, format: :json)
end
