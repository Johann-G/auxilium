# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying old seeds"
Doctor.destroy_all
ConsultationMedication.destroy_all
Medication.destroy_all
Consultation.destroy_all
Patient.destroy_all


puts "Creating 2 new doctors "

my_doctor_1 = Doctor.new(
  email: "gonzague.eritout@gmail.com",
  password: "123456",
  first_name: "Gonzague",
  last_name: "Éritout",
  phone_number: "076 456 78 92",
  city: "Lausanne",
  zip: "1006",
  street: "boulevard de grancy"
)
my_doctor_1.save!

my_doctor_2 = Doctor.new(
  email: "raph.istole@gmail.com",
  password: "123456",
  first_name: "Raph",
  last_name: "Istole",
  phone_number: "076 374 72 92",
  city: "Lausanne",
  zip: "1006",
  street: "avenue de france"
)
my_doctor_2.save!

puts "Creating 4 new patients"

my_patient_1 = Patient.new(
  email: "djamal.alatete@gmail.com",
  password: "123456",
  first_name: "Djamal",
  last_name: "Alatête",
  phone_number: "078 857 02 93",
  city: "Lausanne",
  zip: "1006",
  street: "rue des 7 nains",
  avs_number: "756.4423.6040.23"
)
my_patient_1.save!

my_patient_2 = Patient.new(
  email: "jacobo.bocerveau@gmail.com",
  password: "123456",
  first_name: "Jacobo",
  last_name: "Bocerveau",
  phone_number: "078 834 02 53",
  city: "Lausanne",
  zip: "1006",
  street: "avenue tivoli",
  avs_number: "756.4233.6560.23"
)
my_patient_2.save!

my_patient_3 = Patient.new(
  email: "dede.prime@gmail.com",
  password: "123456",
  first_name: "Dédé",
  last_name: "Primé",
  phone_number: "076 845 12 43",
  city: "Lausanne",
  zip: "1006",
  street: "avenue des bergers",
  avs_number: "756.4233.5980.23"
)
my_patient_3.save!

my_patient_4 = Patient.new(
  email: "malone.athome@gmail.com",
  password: "123456",
  first_name: "Malone",
  last_name: "Athome",
  phone_number: "078 903 01 92",
  city: "Lausanne",
  zip: "1006",
  street: "avenue d'ouchy",
  avs_number: "756.5633.5794.28"
)
my_patient_4.save!

puts "Create 4 new consultations"


my_consultation_1 = Consultation.new(
  title: "Consultation hebdomadaire",
  date: "2020/08/22",
  public_report: "Pensez à la discussion de fin de séance: il faut que vous réfléchissiez au \
  rapport conflictuel que vous avez entretenu avec votre père lors de votre enfance. Qu'est-ce qui \
  a lancé ce conflit, et quelle serait la manière de tourner la page. \
  N'oubliez pas non plus de pratiquer régulièrement une activité physique après le travail afin de \
  vous changer les idées. Cela vous permettra de ne pas penser à la rupture récente avec votre ex \
  petite amie.",
  private_report: "Patient en cours d'amélioration. A encore besoin de temps pour digérer la rupture. \
  Continuer les séances sur les 3 mois à venir. Continuer la prescription de Lexomine pour ses crises \
  d'angoisse, tout en diminuant les doses toutes les 2 semaines.",
  patient: my_patient_1,
  doctor: my_doctor_1
)
my_consultation_1.save!

my_consultation_2 = Consultation.new(
  title: "Consultation bi-mensuel",
  date: "2020/08/26",
  public_report: "Pensez à ce que vous aimez dans la vie",
  private_report: "Patient en dans le dur",
  patient: my_patient_2,
  doctor: my_doctor_1
)
my_consultation_2.save!

my_consultation_3 = Consultation.new(
  title: "Consultation checkup",
  date: "2020/08/25",
  patient: my_patient_3,
  doctor: my_doctor_1
)
my_consultation_3.save!

my_consultation_4 = Consultation.new(
  title: "Consultation c'est pas cher",
  date: "2020/08/27",
  patient: my_patient_4,
  doctor: my_doctor_2
)
my_consultation_4.save!

puts "Create 2 new medication"

my_medication_1 = Medication.new(
  name: "Lexomine"
)
my_medication_1.save!

my_medication_2 = Medication.new(
  name: "Amoxicyline"
)
my_medication_2.save!

puts "Create 2 new ConsultationMedication"

my_consultation_medication_1 = ConsultationMedication.new(
  consultation: my_consultation_1,
  medication: my_medication_1,
  quantity: 3,
  description: "matin midi et soir"
)
my_consultation_medication_1.save!

my_consultation_medication_2 = ConsultationMedication.new(
  consultation: my_consultation_1,
  medication: my_medication_2,
  quantity: 5,
  description: "toutes les 2 heures"
)
my_consultation_medication_2.save!

puts "Seeding done"