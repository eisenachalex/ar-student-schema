require_relative '../../db/config'


class StudentTeachers < ActiveRecord::Base\
	belongs_to :students
	belongs_to :teachers
end