class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :acount_num
      t.string :pwd
      t.string :username
      t.string :realname
      t.string :sex
      t.integer :phone
      t.integer :email
      t.datetime :born_date
      t.boolean :is_teacher
      t.boolean :is_vip
      t.boolean :is_access

      t.timestamps null: false
    end
    add_index :accounts, :acount_num
  end
end
