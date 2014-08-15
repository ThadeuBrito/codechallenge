# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

stations_csv_file = File.read('data/stations.csv')
station_csv = CSV.parse(stations_csv_file, :headers => true)
station_csv.each do |row|
  @station = Station.new
  @station.id          = row.to_hash['id']
  @station.latitude    = row.to_hash['latitude']
  @station.longitude   = row.to_hash['longitude']
  @station.name        = row.to_hash['name']
  @station.zone        = row.to_hash['zone']
  @station.total_lines = row.to_hash['total_lines']
  @station.rail        = row.to_hash['rail']
  @station.save!
end