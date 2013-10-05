require_relative '../../db/config'

class Student < ActiveRecord::Base

	validates :email, :format => { :with => /.*@.*\..{2,}/ }
	validates :email, :uniqueness => true
	validate :check_age
	validate :phone, :format => { :with => /\D*(\d\D*){10}/ }
	
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

