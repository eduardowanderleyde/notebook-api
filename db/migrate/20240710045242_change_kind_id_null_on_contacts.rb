class ChangeKindIdNullOnContacts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :contacts, :kind_id, true
  end
end
