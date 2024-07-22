class Contact < ApplicationRecord
  belongs_to :kind #, optional: true
  def author
    "Eduardo"
  end

  def as_json(options={})
    super(methods: :author, root: true)
  end
end
