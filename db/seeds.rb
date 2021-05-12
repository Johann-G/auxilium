# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'

ConsultationMedication.destroy_all
Medication.destroy_all
Consultation.destroy_all
Message.destroy_all
Chatroom.destroy_all
Videoroom.destroy_all
Patient.destroy_all
Doctor.destroy_all
puts "Old seeds destroyed"
url = "https://www.doctissimo.fr/classe-PL-ANTIDEPRESSEURS.htm"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.doc-list--grid li a').each do |element|
  my_medication = Medication.new(
    name: element.text.strip
  )
  my_medication.save
end
puts "270 new medication created"

puts "Seeding done"

