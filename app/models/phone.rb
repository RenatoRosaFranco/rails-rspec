# frozen_string_sanatizer: true
class Phone < ApplicationRecord
  belongs_to :contact

  validates :phone_type,
  					presence: true,
  					uniqueness: false,
  					allow_blank: false,
  					length: { maximum: 30 }

 	validates :number,
 						presence: true,
 						uniqueness: false,
 						allow_blank: false,
 						length: { maximum: 30 }
end
