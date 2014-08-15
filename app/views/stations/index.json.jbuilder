json.array!(@stations) do |station|
  json.extract! station, :id, :latitude, :longitude, :name, :zone, :total_lines, :rail
  json.url station_url(station, format: :json)
end
