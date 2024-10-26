class Contact < ApplicationRecord
  belongs_to :kind #,optional: true

  def birthdate_br
    # Convertendo a string para um objeto Date antes de usar I18n
    I18n.l(self.birthdate.to_date) unless self.birthdate.blank?
  rescue ArgumentError
    # Retorna nil se a conversão falhar
    nil
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
