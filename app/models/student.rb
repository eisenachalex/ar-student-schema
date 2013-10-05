require_relative '../../db/config'

class Student < ActiveRecord::Base

	has_many :students_teachers
	has_many :teachers, through: :students_teachers
 validates :email, :uniqueness => true
  validates :email, :format => { :with => /\w+@\w+\.\w{2,}/, :message => "invalid email" }
  validates :phone, :format => { :with => /\d{3}.*\d{3}.*\d{4}/, :message => "invalid phone number"}
  validate :check_age

	
	def name
	 p self.first_name + ' ' + self.last_name
	end
	
	def age
    return 0 unless birthday
    Time.now.year - self.birthday.year
 	end
 	
 	def check_age
 		if age < 5
 		errors.add(:birthday, 'too young')
 		end
 	end
end

