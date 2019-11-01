class Apartment < ApplicationRecord
	include Filterable
	scope :apartment_id, -> (apartment_id) {where apartment_id: apartment_id}
	scope :apartment_size, -> (apartment_size) {where apartment_size: apartment_size}
	scope :zip_code, -> (zip_code) {where(zip_code: zip_code)}
	scope :rent, -> (rent) {where(rent: rent)}
	scope :apartment_type, -> (apartment_type) {where(apartment_type: apartment_type)}
	scope :deleted, -> (deleted) {where(deleted: deleted)}
end
