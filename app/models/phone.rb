class Phone < ApplicationRecord
  belongs_to :contact, optional: true
  validates :contact, presence: true
end
