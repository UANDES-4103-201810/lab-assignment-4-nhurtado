class User < ApplicationRecord
	has_many :user_tickets
	has_many :tickets, :through => :user_tickets

	validates_format_of :email, :with => /[A-Za-z0-9]@[A-Za-z0-9].[A-Za-z0-9]/
	validates :password, length: { in: 8..12 }
  validates :phone, length: { in: 9..12 }

end
