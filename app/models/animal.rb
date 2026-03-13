class Animal < ApplicationRecord
	belongs_to :mother_id, class_name: "Animal", optional: true
	belongs_to :father_id, class_name: "Animal", optional: true
	has_many :weight_histories

end
