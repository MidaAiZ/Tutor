class AddAccountRefToStuTea < ActiveRecord::Migration
  def change
    change_table :students do |t|
        t.references :account, foreign_key: true
    end
    change_table :teachers do |t|
        t.references :account, foreign_key: true
    end
    change_table :accounts do |t|
        t.references :student, foreign_key: true
        t.references :teacher, foreign_key: true
    end
  end
end
