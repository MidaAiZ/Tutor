class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :num
      t.string :sex
      t.string :address
      t.string :school
      t.string :grade
      t.string :student_class
      t.string :intro

      t.timestamps null: false
    end
  end
end
