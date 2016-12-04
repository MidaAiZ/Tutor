class ChangeDetailsOfAccouts < ActiveRecord::Migration
  def change
      remove_column :accounts, :acount_num, :string
      remove_column :accounts, :born_date, :datetime
      remove_column :accounts, :realname, :string
      remove_column :accounts, :sex, :string
      remove_column :students, :num, :string

      add_column :accounts, :number, :string
      add_column :students, :bornday, :date
      add_column :teachers, :bornday, :date
      add_column :teachers, :score, :float
  end
end
