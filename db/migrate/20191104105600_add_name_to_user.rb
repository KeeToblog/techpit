class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ""
    # NOT NULL制約(null: false)により、ユーザー名（name)に何もはいっていない状態でユーザーが作成されるのを防げる
  end
end
