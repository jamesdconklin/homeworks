class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :f_name, null: false
      t.string :l_name, null: false
      t.datetime :dob, null: false
    end
  end
end
