class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|

      t.string :title, null: false
      t.references :user, foreign_key: true, null: false
      #テーブル名は「user_id」foreign_key: trueは外部キーとして使用するという意味

      t.timestamps
    end
  end
end
