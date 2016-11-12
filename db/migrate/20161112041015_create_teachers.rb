class CreateTeachers < ActiveRecord::Migration
  def change
      drop_table :teachers
    create_table :teachers do |t|
      t.string :name
      t.string :sex
      t.string :address
      t.string :school
      t.string :intro

      t.timestamps null: false
    end
  end
end
