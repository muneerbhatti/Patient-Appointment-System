class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
         # :recoverable, :rememberable, :validatable,:confirmable,:trackable 

          enum :role, [ :patient, :doctor, :admin, :reception ]
         #enum :role, { patient: 0, doctor: 1, admin: 2, reception:3 }
  belongs_to :userable, polymorphic: true
end

