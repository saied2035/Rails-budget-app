class Payment < ApplicationRecord
	belongs_to :author, class_name: 'User', foreign_key:'author_id'
    has_and_belongs_to_many :payments

	validates :name, presence:true, length:{in:3..25}
	validates :amount, presence: true, numericality: true
end
