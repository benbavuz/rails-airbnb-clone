# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Lawyer.destroy_all
LawyerSpeciality.destroy_all
Speciality.destroy_all

lawyer2 = Lawyer.create(first_name:"Salim", last_name:"lilim", phone_number: "07798274834", email:"salim@gmail.com")
lawyer3 = Lawyer.create(first_name:"SalimB", last_name:"benfarat", phone_number: "0667877898", email:"salim@yahoo.com")
lawyer4 = Lawyer.create(first_name:"fabien", last_name:"frmz", phone_number: "0889787678", email:"fabien@gmail.com")

specialities = ["Admiralty and Maritime Law", "Appellate Law", "Bankruptcy Law", "Criminal Law", "Estate Planning, Trust and Probate Law", "Family Law", "Franchise and Distribution Law", "Immigration and Nationality Law", "Legal Malpractice Law", "Taxation Law", "Workers' Compensation Law"]

specialities.each { |x| Speciality.create(name: x) }
