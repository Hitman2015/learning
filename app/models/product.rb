class Product < ApplicationRecord
	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item
	validates :title, :description, :image_url, presence: true
	validates :title, uniqueness: true
	validates :title, length: { minimum: 10,
															message: "Too short Title (at least 10 symbols)" }
	validates :image_url, allow_blank: true, format: {
							with: %r{\.(gif|jpg|png)\z}i,
							message: 'Must be a URL for GIF, JPG or PNG image.'
						}
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }

	private

		# ensure that there are no line items refenced this product
		def ensure_not_referenced_by_any_line_item
			unless line_items.empty?
				errors.add(:base, 'Line item is present.')
				throw :abort
			end
		end
end