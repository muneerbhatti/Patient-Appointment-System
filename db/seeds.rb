# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

	# self.create_user(email: self.Email, password:"123456")
	# end
d=Doctor.create( Name: "Ali", Email: "doctor@test.com", ConectNo: "123456", 
	Address: "krk", Specialization: "test", Exprince_year: "1 year")
patient=Patient.create(Name:"subhan",CNIC:"654321", PhoneNo:"3213456", email:"patient@test.com", Gender:"M", 
	Address:"Chungi amer sadhu, Lahore Pakistan", date_of_birth:"23-Jan-2007",)
a=Admin.create(Name:"hashim",email:'admin@test.com',address:'krk')
r=Reception.create(Name:'Nadeem',email:'reception@test.com',phoneno:'1234432',address:'kaly')

