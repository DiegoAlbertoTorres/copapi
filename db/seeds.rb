# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'
file = File.read("./data.json")
reports = JSON.parse(file)
reports.each do |report|
	puts report['name']
	hit = Hit.create(name: report['name']);
	#hit = Hit.new();
	#hit.from_json(report);
	#puts hit
end
