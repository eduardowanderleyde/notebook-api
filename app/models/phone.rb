class Phone < ApplicationRecord
  belongs_to :contact
  validates :contact, presence: true
end
