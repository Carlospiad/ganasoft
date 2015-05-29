class Animal < ActiveRecord::Base
	belongs_to :mother_id, class_name: "Animal"
end
