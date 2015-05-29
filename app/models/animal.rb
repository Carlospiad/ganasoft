class Animal < ActiveRecord::Base
	belongs_to :mother_id, class_name: "Animal"
	belongs_to :father_id, class_name: "Animal"
	has_many :weight_histories

end
