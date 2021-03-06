require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
  	create_table :students do |t|
  	t.string :first_name
  	t.string :last_name
  	t.string :gender
  	t.date :birthday
  	t.string :email
  	t.string :phone
  	
  	t.timestamps
  	end
  	
	create_table :teachers do |t|
	t.string :first_name
	t.string :last_name
	t.string :email
	t.string :address
	t.string :phone	
	end
	
	create_table :students_teachers do |t|
	t.belongs_to :student
	t.belongs_to :teacher
	t.timestamps
	end
		
  end
end


