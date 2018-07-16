# fronzen_string_sanatizer: true
class Contact < ApplicationRecord
	has_many  :phones, dependent: :destroy

	validates :firstname,
	 					presence: true,
	 					uniqueness: false,
	 					allow_blank: false,
	 					length: { maximum: 30 }

	validates :lastname,
	 					presence: true,
	 					uniqueness: false,
	 					allow_blank: false,
	 					length: { maximum: 30 }

	def full_name
	 	[firstname, lastname].join("")
	end
end
