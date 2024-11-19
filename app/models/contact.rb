class Contact < ApplicationRecord
  belongs_to :kind #, optional: true
  has_many :phones
  has_one :address
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def as_json(options = {})
  h = super(options)
  if self.birthdate.present?
    h[:birthdate] = I18n.l(self.birthdate.to_date) rescue self.birthdate
  end
  h
end


  # def author
  #  "Eduardo"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:kind_description, :author],
  #     include: { kind: { only: :description }}
  #     )
  # end

  # def hello
  #   I18n.t('hello')
  # end

  # def i18n
  #   I18n.default_locale
  # end
end
