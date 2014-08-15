json.array!(@routes) do |route|
  json.extract! route, :id, :origin_station_id, :destination_station_id, :line_id
  json.url route_url(route, format: :json)
end
