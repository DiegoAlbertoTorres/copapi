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
possReps = ["Murder", "Rape", "Theft", "Robbery", "Mugging", "Car theft", "Panic button"]
reports.each do |report|
  #randRep = "dasdas"
  randRep = possReps[rand(possReps.length)]
  Hit.create(name: report["name"]["first"], last: report["name"]["last"],
             phone: report["phone"], report: randRep,
             latitude: report["lat"], longitud: report["long"],
             contact_name: report["emergencyContact"]["name"]["first"],
             contact_last: report["emergencyContact"]["name"]["last"],
             contact_phone: report["emergencyContact"]["phone"],
             contact_email: report["emergencyContact"]["phone"],
             age: report["age"])

end
