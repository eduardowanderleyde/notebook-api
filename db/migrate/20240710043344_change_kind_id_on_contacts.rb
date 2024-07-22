class ChangeKindIdOnContacts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :contacts, :kind_id, false
  end
end
