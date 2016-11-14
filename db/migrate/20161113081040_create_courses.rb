class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :tutor
      t.string :type
      t.datetime :begintime
      t.datetime :endtime
      t.integer :price
      t.string :place
      t.belongs_to :teacher
      t.belongs_to :student

      t.timestamps null: false
    end
  end
end
