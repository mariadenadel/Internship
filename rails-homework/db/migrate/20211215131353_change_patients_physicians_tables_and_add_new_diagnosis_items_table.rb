class ChangePatientsPhysiciansTablesAndAddNewDiagnosisItemsTable < ActiveRecord::Migration[6.1]
  def change
    change_table :patients do |t|
      t.rename :name, :first_name
      t.string :last_name
      t.integer :age, null: false, default: 1
      t.string :email, null: false, default: "your@email.com"
    end

    change_table :physicians do |t|
      t.rename :name, :first_name
      t.string :last_name
      t.string :phone_number, null: false, default: "+380931234567"
      t.string :level, null: false, default: "junior"
    end

    create_table :diagnosis_items do |t|
      t.text :content
      t.belongs_to :physician
      t.belongs_to :patient
      t.timestamps
    end
  end
end
