# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# IMPORT STATIONS DATA
stations_csv_file = File.read('data/stations.csv')
stations_csv = CSV.parse(stations_csv_file, :headers => true)
stations_csv.each do |row|
  @station             = Station.new
  @station.id          = row.to_hash['id']
  @station.latitude    = row.to_hash['latitude']
  @station.longitude   = row.to_hash['longitude']
  @station.name        = row.to_hash['name']
  @station.zone        = row.to_hash['zone']
  @station.total_lines = row.to_hash['total_lines']
  @station.rail        = row.to_hash['rail']
  @station.save!
end

# IMPORT LINES DATA
# OBS: IMPORT ROUTES LIKE LINES
lines_csv_file = File.read('data/routes.csv')
lines_csv = CSV.parse(lines_csv_file, :headers => true)
lines_csv.each do |row|
  @line        = Line.new
  @line.id     = row.to_hash['line']
  @line.name   = row.to_hash['name']
  @line.colour = row.to_hash['colour']
  @line.stripe = row.to_hash['stripe']
  @line.save!
end

# IMPORT ROUTES DATA
# OBS: IMPORT LINES LIKE ROUTES
routes_csv_file = File.read('data/lines.csv')
routes_csv = CSV.parse(routes_csv_file, :headers => true)
routes_csv.each do |row|
  @routes                        = Route.new
  @routes.origin_station_id      = row.to_hash['station1']
  @routes.destination_station_id = row.to_hash['station2']
  @routes.line_id                = row.to_hash['line']
  @routes.save!
end